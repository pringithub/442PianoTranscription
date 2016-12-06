% MAYBE WE CAN FIGURE OUT WHERE THE KEYS ARE FOR THE START OF EVERY IMAGE
% SET - SINCE KMEANS YIELDS INDETERMINATE AMOUNT OF BLOBS EVERY TIME THE
% KEYMAP MIGHT BE OFF :/

% clc; clear all; 
close all;

src_img = imread('../img/IMG_0467.jpg');

% Open music.ly, write header
fileID = writeHeaderToLilyPadFile;

% Run kmeans, get labeled image
separated = kmeans_clustering(src_img, 5);
figure; imshow(label2rgb(separated, @jet, [.5 .5 .5])); title('K-means clustering of keys');
separated = bwlabel(uint8(separated));

img = separated;%imread('lol1.png');

% Get two refrence points in image, parallel to piano bottom
[initial_corners rotational_corners] = getCriticalCorners(src_img);
img_rot = rotateImage(img, rotational_corners);

% Get the centroids of the image
% Note - may be useful later
measurements = regionprops(img_rot, 'Centroid');
centroids = cat(1,measurements.Centroid);
centroids = centroids(find(sum(isnan(centroids),2)==0),:);
figure; imshow(img); title('Cluster selected by Kmeans algorithm with centroids'); hold on;
plot(centroids(:,1), centroids(:,2), 'm*'); hold off;

% Key map should be over the range of keys in the image
% Should be fixed per image set
keyMap = ['a' 'b' 'c' 'd' 'e' 'f' 'g' 'a' 'b' 'c' 'd'];

theKeysAre = getPressedKeysFromImage(img_rot, keyMap, initial_corners);

% wrtie note to file
for i = 1:size(theKeysAre)
    key = strcat( theKeysAre(i), num2str(2));    
    fprintf(fileID, ' ');
    fprintf(fileID, key);    

end
fprintf(fileID, '\n}');
fclose(fileID);

dos('runPad.bat');