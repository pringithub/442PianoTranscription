function keyValue = findClosestKey(separatedImg, point, radiusOfReach)

  % check if the corner point is part of the key
  point = floor(point);
  pinpoint = separatedImg(point(2), point(1));
  if pinpoint > 0
    keyValue = pinpoint;
    return;
  end


  % find the key closest to the point by expanding a rectangle 
  radius = radiusOfReach;
  rectPx = [point(1)-radius point(2)-radius;
            point(1)-radius point(2);
            point(1)-radius point(2)+radius;
            point(1) point(2)-radius;            
            point(1) point(2)+radius;
            point(1)+radius point(2)-radius;
            point(1)+radius point(2);
            point(1)+radius point(2)+radius
            ];
        
  for i = 1:size(rectPx)
      
      pinpoint = separatedImg( rectPx(i, 2), rectPx(i, 1) );
      if pinpoint > 0
          keyValue = pinpoint;
          return;
      end
      
  end
  
  keyValue = 0;
  
end

