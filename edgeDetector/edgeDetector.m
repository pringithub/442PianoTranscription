function edgeDetector(filename,edge_thresh)
%edgeDetector.m

  close all;
  warning('off');

  %Read the image and convert from color to black & white
  color_im = imread(filename);
  bw_im = double(rgb2gray(color_im));

  %Smooth image
  %sigma = 1;
  bw_smooth = gaussianSmoother(bw_im);%, sigma);

  %Calculate row and column difference matrices
  [row_diffs col_diffs] = rowColDiffCalc(bw_smooth);

  %Calculate gradient magnitude and direction matrices
  [G_mag, G_dir] = gradientCalc(row_diffs, col_diffs);

  inverseG_mag = (255-G_mag);
  imshow(uint8(inverseG_mag));
  title('Gradient Magnitude');
  
  %Add colors to the original black & white image
  edges = addColors(G_mag, G_dir, edge_thresh);

  %Subplot display
  figure
  subplot(3,2,1),imshow(uint8(color_im));
  title(strcat(['Input Image: ' filename]),'Interpreter','none');
  subplot(3,2,2),imshow(uint8(bw_im));
  title('B&W Image');
  subplot(3,2,3),imshow(uint8(bw_smooth));
  title('Gaussian Smoothing');
  subplot(3,2,4),imshow(uint8(255*abs(bw_smooth-bw_im)));
  title('Normalized Noise Reduction');
  subplot(3,2,5),imshow(uint8(G_mag));
  title('Gradient Magnitude');
  subplot(3,2,6),imshow(uint8(edges));
  title(strcat(['Edge Directions: Thresh = ' num2str(edge_thresh)]));

  %Write to G_mag and Edges JPG files because they look cool!
  imwrite(uint8(inverseG_mag),'inverseG_mag.jpg','jpg');

end
