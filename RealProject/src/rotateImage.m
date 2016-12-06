function img_rot = rotateImage(img, rotational_corners)

    x = rotational_corners(1,:);
    y = rotational_corners(2,:);
    
  point1 = [x(1) y(1) 1];
  point2 = [x(2) y(2) 1];
  l = cross(point1,point2);
  % Rotate image
  angle_deg = atan( (point2(2)-point1(2)) / (point2(1)-point1(1)) ) *180/pi;
  img_rot = imrotate(img, angle_deg);
  
    % Dedicated figure for image rotation
    figure; imshow(img_rot); title('Image rotation'); hold on;
    hold off;
  
end