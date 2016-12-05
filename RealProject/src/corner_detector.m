function [edgeImg, C] = corner_detector(img)

gray_img = rgb2gray(img);
blurImg = imgaussfilt(gray_img, 1);
C = corner(blurImg, 200);

edgeImg = edge(gray_img, 'sobel'); 
edgeImg = bwmorph(edgeImg, 'close', 1); 
edgeImg = bwmorph(edgeImg, 'thin', Inf);

end