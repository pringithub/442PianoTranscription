function [new_img] = mygaussianSmoother(img, sigma)
 %set the kernel size
 kernel_size = 2*ceil(2*sigma)+1;
 size_max = kernel_size/2-.5;
 %get the Gaussian kernel
 G = zeros(kernel_size,kernel_size);
 for i = -size_max:size_max
   for j = -size_max:size_max
     G(i +size_max+1, j +size_max+1) = exp( -(i*i + j*j) / (2*sigma^2) );
   end
 end
 G = G/sum(sum(G))


 %create new image to store the results of the convolution
 % - removing this gets rid of the edges!
 %new_img = zeros(size(img,1), size(img,2));

 %convolve the kernel and the image -go through all dimensions of
 %the image, and apply our kernel to various windows of the image
 rows_image = size(img,1); row_end = rows_image-kernel_size+1;
 cols_image = size(img,2); col_end = cols_image-kernel_size+1;
 for i = 1:row_end
   for j = 1:col_end
     A = img(i:i+kernel_size-1, j:j+kernel_size-1);
     val = sum(sum(double(A).*G));
     new_img(i, j) = val;
   end
 end

 
 
 
end
