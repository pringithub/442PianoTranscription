% MAYBE WE CAN FIGURE OUT WHERE THE KEYS ARE FOR THE START OF EVERY IMAGE
% SET - SINCE KMEANS YIELDS INDETERMINATE AMOUNT OF BLOBS EVERY TIME THE
% KEYMAP MIGHT BE OFF :/


clc; clear all; close all;


% Run kmeans, get labeled image
separated = kmeans_clustering(imread('IMG_0460.jpg'));
separated = bwlabel(uint8(separated));


img = separated;%imread('lol1.png');
figure, imshow(img), hold on

% Get two refrence points in image, parallel to piano bottom
% Note - not necessary
img_rot = rotateImage(img);
figure, imshow( img_rot ), hold on

% Get the centroids of the image
% Note - may be useful later
measurements = regionprops(img_rot, 'Centroid');
centroids = cat(1,measurements.Centroid);
centroids = centroids(find(sum(isnan(centroids),2)==0),:)
plot(centroids(:,1), centroids(:,2), 'r*');


% Key map should be over the range of keys in the image
% Should be fixed per image set
keyMap = ['f' 'g' 'a' 'b' 'c' 'd' 'e' 'f' 'g' 'a' 'b' 'c' 'd'];

%MICHAEL - need way to filter corners to get only one corner per true key pressed
%criticalCorners = floor(fxnThatGetsCriticalCorners(..,..));
theKeysAre = getPressedKeysFromImage(img_rot, criticalCorners, keyMap);

