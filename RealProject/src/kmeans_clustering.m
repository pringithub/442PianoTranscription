function separated = kmeans_clustering(rgb_img, k)

    close all;
    
    % Create HSV image
    mask = makecform('srgb2lab');
    hsv_img = applycform(rgb_img,mask);
    
    % Perform kmeans on the HSV image. Requires a resized HSV image
    resized_hsv = double(hsv_img(:,:,2:3));
    nrows = size(resized_hsv,1);
    ncols = size(resized_hsv,2);
    resized_hsv = reshape(resized_hsv,nrows*ncols,2);
    [cluster_idx, cluster_center] = kmeans(resized_hsv,k,'distance','sqEuclidean', 'Replicates',3);

    % Reform the image using the cluster IDs as a mask
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    
    % Create a container for each cluster
    segmented_images = cell(1,3);
    rgb_label = repmat(pixel_labels,[1 1 3]);

    largestNumPixels = 0;
    
    for i = 1:k
        
        % Mask each pixel in the oringal image if it belongs to this
        % cluster
        color = rgb_img;
        color(rgb_label ~= i) = 0;
        segmented_images{i} = color;
        
        % Convert to grayscale
        bw = imbinarize(rgb2gray(segmented_images{i}));
        
        % Blob detect in the specific cluster
        bw = bwareaopen(bw,200);
        
        % Fill any holes inside each blob
        bw = imfill(bw,'holes');
        [B,L] = bwboundaries(bw,'noholes');
        
        % Find the image with the white keys
        % We assume that that image has the most nonzero pixels
        n = nnz(L);
        if n > largestNumPixels
          largestNumPixels = n;
          separated = L;
        end
    end

end