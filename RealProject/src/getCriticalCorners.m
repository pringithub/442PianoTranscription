function final_corners = getCriticalCorners(img)

    % Obtain bounding box of where the keys edge's occur
    input_points = round(ginput(2));
    input_points(input_points<0)=1;
    if input_points(2,1) > size(img,2)
        input_points(2,1) = size(img,2);
    end
    
    % Retreive the corners and edges
    [edges corners] = corner_detector(img(input_points(1,2):input_points(2,2), input_points(1,1):input_points(2,1), :));
    plot(corners(:,1), corners(:,2)+input_points(1,2), 'r*');
    
    % Average the y coordinates of the corners, and identify which corners
    % are not on the average line
    line_of_fit = polyfit(corners(:,1), corners(:,2), 1);
    theoretical_ys = polyval(line_of_fit, corners(:,1));
    plot(corners(:,1), theoretical_ys+input_points(1,2), 'b*');
    
    threshold = 5;
    final_corners = [corners(corners(:,2)-theoretical_ys>threshold, 1), ...
        corners(corners(:,2)-theoretical_ys>threshold, 2)+input_points(1,2)];
    plot(final_corners(:,1), final_corners(:,2), 'y*');

end