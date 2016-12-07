clc; clear all; 
close all;

% Open music.ly, write header
fileID = writeHeaderToLilyPadFile;

% Get filenames of images
datasetFiles = dir('../ScaleDataset');
datasetFiles = datasetFiles(3:end);
for i = 1:size(datasetFiles)
    datasetFiles(i).name = strcat('../ScaleDataset/',datasetFiles(i).name);
end

% Key map should be over the range of keys in the image
% Should be fixed per image set
keyMap = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'a' 'b' 'c' 'd'];
pressedLength = 8;
theKeysWere = [];
k_clusters = 5;

for i = 1:size(datasetFiles)
    
    origImg = imread(datasetFiles(i).name);
    
    clusteredImg = kmeans_clustering(origImg, k_clusters);
    figure; imshow(label2rgb(clusteredImg, @jet, [.5 .5 .5])); title('K-means clustering of keys');
    clusteredImg = bwlabel(uint8(clusteredImg));

    % Get two refrence points in image, parallel to piano bottom
    [initial_corners rotational_corners] = getCriticalCorners(origImg);
    img_rot = rotateImage(clusteredImg, rotational_corners);

    % Get the centroids of the image
    measurements = regionprops(img_rot, 'Centroid');
    centroids = cat(1,measurements.Centroid);
    centroids = centroids(find(sum(isnan(centroids),2)==0),:);
    centroidsX = [1; centroids(:,1); size(img_rot, 2)];
    for j = 2:size(centroidsX)-1
        if ( ( centroidsX(j)-centroidsX(j-1) > 80 ) && ...
             ( centroidsX(j+1)-centroidsX(j) > 80 ) )
             img_rot(:,floor(centroidsX(j))) = 0;
             % img_rot = bwlabel(img_rot);
        end
    end
    figure; imshow(img_rot); title('Centroid plot'); hold on;
    plot(centroids(:,1), centroids(:,2), 'm*'); hold off;

    theKeysAre = getPressedKeysFromImage(img_rot, keyMap, initial_corners);

    % Write note/rest to file  
    pressedLength = writeImageNotesToFile(fileID, theKeysAre, theKeysWere, i, pressedLength);
    theKeysWere = theKeysAre;
    
    display(theKeysAre);

end

% Append footer to music.ly
fprintf(fileID, '\n}');
fclose(fileID);

dos('runPad.bat');