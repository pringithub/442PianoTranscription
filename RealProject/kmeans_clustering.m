function separated = kmeans_clustering(rgb_img)

    close all;

    cform = makecform('srgb2lab');
    lab_img = applycform(rgb_img,cform);
    ab = double(lab_img(:,:,2:3));
    nrows = size(ab,1);
    ncols = size(ab,2);
    ab = reshape(ab,nrows*ncols,2);
    nColors = 5;
    % repeat the clustering 3 times to avoid local minima
    [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', 'Replicates',3);
    pixel_labels = reshape(cluster_idx,nrows,ncols);
    figure; imshow(pixel_labels, []), title('image labeled by cluster index');
    
    segmented_images = cell(1,3);
    rgb_label = repmat(pixel_labels,[1 1 3]);

    
    
    largestNumPixels = 0;
    
    for k = 1:nColors
        color = rgb_img;
        color(rgb_label ~= k) = 0;
        segmented_images{k} = color;
        bw = imbinarize(rgb2gray(segmented_images{k}));
        bw = bwareaopen(bw,200);
        bw = imfill(bw,'holes');
        [B,L] = bwboundaries(bw,'noholes');
        
        
        % Find the image with the white keys
        % We assume that that image has the most nonzero pixels
        n = nnz(L)
        if n > largestNumPixels
          largestNumPixels = n;
          separated = L;
        end
        
        
        figure; imshow(label2rgb(L, @jet, [.5 .5 .5]))
        hold on
        for k = 1:length(B)
          boundary = B{k};
          %plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)                         
        end
    end

end