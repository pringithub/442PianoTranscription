function [ bw_smooth ] = gaussianSmoother( bw_im )

  %gaussianMatrix = 

  %Calculate gradient magnitude and direction matrices
  [bw_smooth] = meshgrid(1:size(bw_im,2),1: size(bw_im,1));
  for i = 2:size(bw_im,1)-1
      for j = 2:size(bw_im,2)-1
      %Smooth equation for each element in the vector
      bw_smooth(i,j)=(10*bw_im(i-1,j-1)+27*bw_im(i-1,j)+10*bw_im(i-1,j+1)+ ...
                      27*bw_im(i,j-1)+74*bw_im(i,j)+27*bw_im(i,j+1)+       ... 
                      10*bw_im(i+1,j-1)+27*bw_im(i+1,j)+10*bw_im(i+1,j+1)  ...
                     )/222;
      end
  end

end
