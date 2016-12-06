function [final_corners rotational_indexes] = getCriticalCorners(img)
    
    % Dedicated figure for corner detection
    figure; imshow(img); title('Corner detection'); hold on;

    % Retreive the corners and edges
    [edges corners] = corner_detector(img);
    
    % Use kmeans to identify the corners correlating to the edges of the
    % keys
    [cluster_idxs,cluster_centers] = kmeans(corners(:,2),4,'distance','sqEuclidean', 'Replicates',3);
    bot_cluster = find(cluster_centers == max(cluster_centers));
    cluster_centers(bot_cluster) = 1;
    mid_cluster = find(cluster_centers == max(cluster_centers));
    x_coords = corners(cluster_idxs==mid_cluster,1);
    y_coords = corners(cluster_idxs==mid_cluster,2);
    plot(x_coords, y_coords, 'r*');
    
    % Average the y coordinates of the corners, and identify which corners
    % are not on the average line
    line_of_fit = polyfit(x_coords, y_coords, 1);
    theoretical_ys = polyval(line_of_fit,x_coords);
    plot(x_coords, theoretical_ys, 'b*');
    
    % Find the local minimum and maximum x coordinates for later use when
    % rotating
    min_x = find(x_coords == min(x_coords));
    max_x = find(x_coords == max(x_coords));
    
    % Find which corners are far away from their predicted corners
    threshold = 5;
    final_corners = [x_coords(y_coords-theoretical_ys>threshold), ...
        y_coords(y_coords-theoretical_ys>threshold)];
    plot(final_corners(:,1), final_corners(:,2), 'y*');
    
    rotational_indexes = [x_coords(min_x) x_coords(max_x); ...
        theoretical_ys(min_x) theoretical_ys(max_x)];
    
    hold off;

end