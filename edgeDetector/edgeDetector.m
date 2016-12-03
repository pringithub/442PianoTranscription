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

  edge = (G_mag);
  for i = 1:size(edge,1)
    for j = 1:size(edge,2)
        
        if edge(i,j) < 15
            edge(i,j) = 0;
        else
            edge(i,j) = 255;
        end
    end
  end  
  
  
  imshow(uint8(edge));
  title('Binarized Gradient Magnitude');
  
  corners = corner(bw_im);
  hold on
  plot(corners(:,1),corners(:,2),'r*');
  

  
  
  
end
