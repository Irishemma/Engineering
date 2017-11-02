%%  读取ABAQUS的rpt文件
%%
function data = calP( fileName)
fid = fopen(fileName, 'r');
% tline = fgetl(fid);
i = 1;
while feof(fid) == 0
    tlineTable{i,1} = fgetl(fid);
    i = i + 1;
end
fclose(fid);

i = 1;
while (1)
    if  length(strfind(tlineTable{i,1}, 'ODB:')) ~= 0 
        break;
    end
    i = i+1;
end

i = i+10;
j = 1;
while length( tlineTable{i,1} ) > 3
    str = tlineTable{i,1};
    while strfind(str,'  ')
        str = strrep(str,'  ',' ');
    end
    S = regexp(str, ' ', 'split');
    %     节点号，x轴，y轴，p值
    data(j, 1) = str2double(S(3));
    data(j, 2) = str2double(S(7));
    data(j, 3) = str2double(S(8));
    i = i+1; j = j+1;
end
i = i+4;
while length( tlineTable{i,1} ) > 3
    str = tlineTable{i,1};
    while strfind(str,'  ')
        str = strrep(str,'  ',' ');
    end
    S = regexp(str, ' ', 'split');
    %     节点号，x轴，y轴，p值
    mid(1) = find(data==str2double(S(3)));
    data(mid, 4) = str2double(S(5));
    i = i+1;
end

i=1;
j=length(data);
while( i<= j)
    if( isnan( data(i,3) ) )
        data(i,:)=[];
        j=length(data)
        i=i-1;
    end    
    i = i + 1;
end