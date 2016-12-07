function theKeysAre = getPressedKeysFromImage(img, keyMap, criticalCorners)

    theKeysAre = [];
	lastKeyValue = 0;
	radiusOfReach = 3;
 
    for i = 1:size(criticalCorners)
        point = [criticalCorners(i,1) criticalCorners(i,2)];
        keyValue = findClosestKey(img, point, radiusOfReach);
        if keyValue ~= 0 && lastKeyValue ~= keyValue
            lastKeyValue = keyValue;
            theKeysAre = [theKeysAre keyMap( keyValue )];
        end 
    end

end