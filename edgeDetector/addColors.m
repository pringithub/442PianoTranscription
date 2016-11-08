function [ edges ] = addColors( g_mag, g_dir, thresh )
%This function takes the inputs and a threshold and created a color 3D
%image.
  
    edges = zeros(size(g_mag,1),size(g_mag,2),3);
    for i = 1:size(g_mag,1)
        for j = 1:size(g_mag,2)
            %Black
            if(g_mag(i,j)<thresh)
                edges(i,j,1) = 0;
                edges(i,j,2) = 0;
                edges(i,j,3) = 0;
            end
            %Red
            if(g_mag(i,j)>=thresh && g_dir(i,j)==0)
                edges(i,j,1) = 255;
                edges(i,j,2) = 0;
                edges(i,j,3) = 0;
            end
            %Green
            if(g_mag(i,j)>=thresh && g_dir(i,j)==45)
                edges(i,j,1) = 0;
                edges(i,j,2) = 255;
                edges(i,j,3) = 0;
            end
            %Blue
            if(g_mag(i,j)>=thresh && g_dir(i,j)==90)
                edges(i,j,1) = 0;
                edges(i,j,2) = 0;
                edges(i,j,3) = 255;
            end
            %Yellow
            if(g_mag(i,j)>=thresh && g_dir(i,j)==135)
                edges(i,j,1) = 255;
                edges(i,j,2) = 255;
                edges(i,j,3) = 0;
            end
        end
    end
end
