function showLine

  close all

  filename = 'inverseG_mag.jpg';
  img = imread(filename);
  
  imshow(img); 
  
  %---------- should be doing Harris corner detection here
  [x,y] = ginput(2);
  point1 = [x(1);y(1);1];
  point2 = [x(2);y(2);1];
  line = cross(point1,point2);
  %--------------------------------------
  
  %plot the line (for now)  
  hold on
  plot_line(line);
  hold off
  
end