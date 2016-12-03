function theKeysAre = getPressedKeysFromImage(img, criticalCorners, keyMap)

  %{
  theKeysAre = [];
  for i = 1:size(criticalCorners)
    point = [criticalCorners(i,1) criticalCorners(i,2)];
    keyValue = findClosestKey(img, point);
    theKeysAre = [theKeysAre keyMap( keyValue )];
  end
  %}    

  % test a point !
  [x,y] = ginput(1);
  point = floor([x y]);
  plot(point(1), point(2), 'b+');
  keyValue = findClosestKey(img, point);
  theKeysAre = [theKeysAre keyMap( keyValue )];
  
end