function [] = fixPy(fileNameIn, fileNameOut, boltPress, n)

pos = 0;
pattern = '*#*';
fidr = fopen(fileNameIn,'rt');
fidw = fopen(fileNameOut,'wt');
while ~feof(fidr)
    s = fgetl(fidr);
    result = strfind(s, pattern);
    if ( ~isempty(result) )
        pos = pos + 1;
        sTemp = num2str( boltPress( pos ) );   
        s = strrep(s,pattern,sTemp);
    end
    fprintf(fidw,'%s\n',s);
end
fclose(fidr);
fclose(fidw);