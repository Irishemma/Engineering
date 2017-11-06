clc;  clear;
close all;
hold on;
grid minor;
grid on;
% 
% d_t = calP('fa-1031-ex1.rpt');
% d_t = sortrows(d_t, 4);
% 
% xo = -6.270e-02; yo = 1.851e-01;
% for i = 1:length(d_t)
%     d_t(i,6) = d_t(i,2) - xo;
%     d_t(i,7) = d_t(i,3) - yo;
%     d_t(i,8) = atan(d_t(i,6) / d_t(i,7));
%     if(d_t(i,7) < 0)
%         d_t(i,8) = -d_t(i,8) - pi/2;
%     else
%         d_t(i,8) = -d_t(i,8) + pi/2;
%     end
% end
% save aa;
load aa;
%% 画点图
d_t(:,8) = d_t(:,8) .*180./pi;
d_t(:,4) = -d_t(:,4);
figure (1);
scatter(d_t(:,6),d_t(:,7),'filled','cdata',d_t(:,4))

%% 以角度为横坐标展开
figure (2);
d_t = sortrows(d_t, 8);
scatter(d_t(:,8),d_t(:,4),'filled','cdata',d_t(:,4))
hold on
scatter(d_t(:,8)+ 360,d_t(:,4),'filled','cdata',d_t(:,4))
grid minor;
grid on;

x1 = -1.177e-01 - xo;
y1 = 2.036e-01 - yo;
x2 = -7.918e-02 - xo;
y2 = 1.326e-01 - yo;
x3 = -9.183e-03 - xo;
y3 = 2.036e-01 - yo;

angel(1) = -atan(x1/y1)*180/pi + 90;
angel(2) = -atan(x2/y2)*180/pi - 90;
angel(3) = -atan(x3/y3)*180/pi + 90;
for i = 1 : 3
    line([angel(i) angel(i)],[0 3.5e7]);
    line([angel(i)+360 angel(i)+360],[0 3.5e7]);
end

%% 计算总压力(加窗，每个窗点数不一样）
d_t = sortrows(d_t, 8);
N = 36;
%外半径47.4087，内半径44.7789，宽度2.6298
R = 47.4087; r = 44.7789;
S = pi * (R*R - r*r);
deltaAngle = 360/N;
p = zeros(N,1);
num = zeros(N,1);
meanP = 0;
for i = 1 : N
    left = deltaAngle * i - 180 - deltaAngle;
    right = left + deltaAngle;
    win = find( (d_t(:,8) >= left) & (d_t(:,8) <= right) );
    num(i) = length(win);
    for j = 1 : length(win)
        p(i) = p(i) + d_t(win(j),4);
    end
    p(i) = p(i) / length(win);
    meanP = meanP + p(i);
end
meanP = meanP / N;

P = meanP/1e6 * S;
% 1.002839e+04
