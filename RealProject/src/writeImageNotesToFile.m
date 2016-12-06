function pressedLength = writeImageNotesToFile(fileID, theKeysAre, theKeysWere, i, pressedLength)

    % If keys are same accross 2+ images, make the note 
    %   longer in the sheet music
    %   - Resolution will be eigth note
    if i > 3 && theKeysAre == theKeysWere
        pressedLength = pressedLength/2;
    else
        pressedLength = 8;
    end
    
    
    % Multiple keys detected as pressed - write chord
    if size(theKeysAre) > 1
        fprintf(fileID, ' <');
        for j = 1:size(theKeysAre)-1
            key = strcat(theKeysAre(j),' ');
            fprintf(fileID, key);
        end
        fprintf(fileID, strcat('>',num2str(pressedLength)));                 
        fprintf(fileID, ' ');
                                                                            
    % Single key detected as pressed - write note
    elseif size(theKeysAre) == 1        
        key = strcat( theKeysAre(1), num2str(pressedLength));    
        fprintf(fileID, ' ');
        fprintf(fileID, key);   

    % No keys detected as pressed - write rest
    else
        rest = strcat('r', num2str(pressedLength));
        fprintf(fileID, ' ');
        fprintf(fileID, rest);
  
    end
        

end