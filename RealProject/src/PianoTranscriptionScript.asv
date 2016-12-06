% MAYBE WE CAN FIGURE OUT WHERE THE KEYS ARE FOR THE START OF EVERY IMAGE
% SET - SINCE KMEANS YIELDS INDETERMINATE AMOUNT OF BLOBS EVERY TIME THE
% KEYMAP MIGHT BE OFF :/


clc; clear all; close all;

% Open music.ly, write header
fileID = writeHeaderToLilyPadFile;

% Get filenames of images
datasetFiles = dir('../ScaleDataset');
datasetFiles = datasetFiles(3:end);
for i = 1:size(datasetFiles)
    datasetFiles(i).name = strcat('../ScaleDataset/',datasetFiles(i).name);
end

% Read in image without keys pressed, get keyMap
% TODO: THIS lol
kclusters = 4;
unpressedImg = imread(datasetFiles(1).name);
clusteredImg = kmeans_clustering(unpressedImg, kclusters);
clusteredImg = bwlabel(uint8(clusteredImg));
figure, imshow(clusteredImg);
%
% Key map should be over the range of keys in the image
% Should be fixed per image set
%  keyMap = ??
%
keyMap = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'a' 'b' 'c' 'd'];


pressedLength = 8;
theKeysWere = [];
for i = 2:size(datasetFiles)    

    origImg = imread(datasetFiles(i).name);
    
    % Run kmeans, get labeled image
    clusteredImg = kmeans_clustering(origImg, kclusters);
    img = bwlabel(uint8(clusteredImg));    
    figure, imshow(img), hold on

    % Get two refrence points in image, parallel to piano bottom
    % Note - not necessary
    img_rot = img;%rotateImage(img);

    % Get the centroids of the image
    % If blob contatins multiple keys, separate them
    measurements = regionprops(img_rot, 'Centroid');
    centroids = cat(1,measurements.Centroid);
    centroids = centroids(find(sum(isnan(centroids),2)==0),:)
    centroidsX = [1; centroids(:,1); size(img_rot, 2)];
    for j = 2:size(centroidsX)-1
        if ( ( centroidsX(j)-centroidsX(j-1) > 80 ) && ...
             ( centroidsX(j+1)-centroidsX(j) > 80 ) )
             img_rot(:,floor(centroidsX(j))) = 0;
             img_rot = bwlabel(img_rot);
        end
    end
    figure, imshow( img_rot ), hold on            
    plot(centroids(:,1), centroids(:,2), 'r*');


    % Get corners in critical section of piano
    critCorners = getCriticalCorners(origImg);
    theKeysAre = getPressedKeysFromImage(img_rot, keyMap, critCorners)
    

    % Write note/rest to file  
    pressedLength = writeImageNotesToFile(fileID, theKeysAre, theKeysWere, i, pressedLength);
    theKeysWere = theKeysAre;
    
end


% Append footer to music.ly
fprintf(fileID, '\n}');
fclose(fileID);

% Create pdf from music.ly
dos('runPad.bat');


