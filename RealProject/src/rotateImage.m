function img_rot = rotateImage(img)

  %[x,y] = ginput(2);
  x = [147;774];
  y = [413;400];
  point1 = [x(1) y(1) 1];
  point2 = [x(2) y(2) 1];
  l = cross(point1,point2);
  plot_line(l);
  % Rotate image
  angle_deg = atan( (point2(2)-point1(2)) / (point2(1)-point1(1)) ) *180/pi;
  img_rot = imrotate(img, angle_deg);
  
end