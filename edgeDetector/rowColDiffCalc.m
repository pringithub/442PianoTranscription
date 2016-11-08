function [ row_diffs,col_diffs ] = rowColDiffCalc( bw_smooth )
%This function takes the bw_smooth matrix and outputs them into two outputs, row_diffs and col_diffs that are the same size at bw_im

  row_diffs = zeros(size(bw_smooth));
  col_diffs = zeros(size(bw_smooth));
  for i = 2:size(bw_smooth,1)-1
    for j = 2:size(bw_smooth,2)-1
      %calc differences
      row_diffs(i,j) = bw_smooth(i+1,j)-bw_smooth(i-1,j);
      col_diffs(i,j) = bw_smooth(i,j+1)-bw_smooth(i,j-1);
    end
  end

end
