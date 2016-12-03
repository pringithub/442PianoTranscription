function keyValue = findClosestKey(separatedImg, point)

  % check if the corner point is part of the key
  point = floor(point);
  pinpoint = separatedImg(point(2), point(1));
  if pinpoint > 0
    keyValue = pinpoint;
    return;
  end


  % find the key closest to the point by expanding a rectangle - NOT DONE
  rectPx = [];
  radius = 1;
  
  rectPx = [point(1)-radius point(2)-radius;
            point(1)-radius point(2);
            point(1)-radius point(2)+radius;
            point(1) point(2)-radius;            
            point(1) point(2)+radius;
            point(1)+radius point(2)-radius;
            point(1)+radius point(2);
            point(1)+radius point(2)+radius;
            ];

end

