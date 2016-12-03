function fileID = writeHeaderToLilyPadFile

file = 'C:\Users\Phillip\College\EECS442\Project\442PianoTranscription\RealProject\music.ly'
fileID = fopen(file, 'w');

fprintf(fileID, '\\version "2.16.0"\n');
fprintf(fileID, '\\header { \n  title = "Phil');
fprintf(fileID, 's Majestic Beauty"\n');
fprintf(fileID, '  subtitle = balls \n}\n');% can't be more than two words?


fprintf(fileID, '\n\n\\relative c'' {\n');

end
