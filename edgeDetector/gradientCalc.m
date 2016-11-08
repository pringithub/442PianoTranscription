function [ g_mag,g_dir ] = gradientCalc( row_diffs,col_diffs )
%This function takes the row and column inputs and calculates magnitudes
%and directions .

  g_mag = zeros(size(row_diffs));
  g_dir = 90*ones(size(col_diffs));

  for i = 2:size(row_diffs,1)-1
    for j = 2:size(col_diffs,2)-1
      %create temporary angle as long as value is positve
      tempgle = atand((row_diffs(i,j))/col_diffs(i,j));
      if(isnan(tempgle))
        g_dir(i,j) = 90; %nonnumbers are set to equal 90
      end
      g_mag(i,j) = sqrt((row_diffs(i,j)^2)+(col_diffs(i,j)^2));
      g_dir(i,j) = 45*round(tempgle/45);%angles should be rounded to the nearest multiple of 45 degrees
      %if direction is negative
      if(g_dir(i,j)<0)
        g_dir(i,j) = g_dir(i,j)+180;
      end
    end
  end

end
