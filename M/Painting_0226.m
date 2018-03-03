clc;clear;
close all;
%% C — Fo  关系曲线
figure (1);
a = [15	11713.11433	2.368786	-47.25741
16	12118.1103	2.390566	-47.26344
17	12528.13698	2.4276	-47.268
18	12946.47703	2.450742	-47.27269
19	13390.44672	2.491528	-47.27739
20	13869.35683	2.518688	-47.28217
];
plot( a(:,1), a(:,2),'-d', 'MarkerSize',5);
    xlabel ('O形圈变形率（%）');
    ylabel ('O形圈接触压力（N）');
%     legend('O形圈接触压力', '阀片端面油液压力', '阀片端面受力总和');
     set(gca,'FontSize',8);
     set(gca,'xtick',[15:0.5:20]);
%      set(gca,'ytick',0:20000:100000);
     xlim([15, 20]);
     fitValue = polyfit(a(:,1), a(:,2), 1);
% plot( a(:,1), a(:,3),'-d', 'MarkerSize',10);
% plot( a(:,1), a(:,4),'-d', 'MarkerSize',10);
grid on;

% figure resize
set(gcf,'color','white','paperpositionmode','auto');
% 单图比例
set(gcf,'Position',[100 100 420 260]);
set(gca,'Position',[.13 .16 0.80 .75]);
figure_FontSize=10;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','bottom');
set(findobj('FontSize',8),'FontSize',figure_FontSize);
% set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',1);
ylim([1.15e4 1.4e4])
% print(1,'-dpng','aa.png', '-r200')

%% 画点图  无预紧
figure(2)
load aa;
d_t = sortrows(d_t, 4);

xo = -6.270e-02; yo = 1.851e-01;
d_t(:,6) = d_t(:,2) - xo;
d_t(:,7) = d_t(:,3) - yo;
d_t(:,8) = atan(d_t(:,6) ./ d_t(:,7));
    
for i = 1:length(d_t)
    d_t(i,6) = d_t(i,2) - xo;
    d_t(i,7) = d_t(i,3) - yo;
    d_t(i,8) = atan(d_t(i,6) / d_t(i,7));
    if(d_t(i,7) < 0)
        d_t(i,8) = -d_t(i,8) - pi/2;
    else
        d_t(i,8) = -d_t(i,8) + pi/2;
    end
end

d_t(:,9) = sqrt( d_t(:,6).*d_t(:,6) + d_t(:,7).*d_t(:,7));
 r=(0.044168779 + 0.0447709) / 2;
 R= (0.0473978 + 0.048042379)/2;

 d_t = d_t(find(d_t(:,9) <R) , :);
 d_t = d_t(find(d_t(:,9) >r) , :);
 
x1 = -1.177e-01 - xo;
y1 = 2.036e-01 - yo;
x2 = -7.918e-02 - xo;
y2 = 1.326e-01 - yo;
x3 = -9.183e-03 - xo;
y3 = 2.036e-01 - yo;

angel(1) = -atan(x1/y1)*180/pi + 90;
angel(2) = -atan(x2/y2)*180/pi - 90;
angel(3) = -atan(x3/y3)*180/pi + 90;

colormap jet;
grid minor;
grid on;
d_t(:,8) = d_t(:,8) .*180./pi;
d_t(:,4) = -d_t(:,4);
c = linspace(1,10,length(d_t));
scatter(d_t(:,6),d_t(:,7),3,d_t(:,4),'filled');

for i = 1 : 3
    b1x=R*cos(angel(i)*pi/180); b1y = R*sin(angel(i)*pi/180);
    line([0 b1x],[0 b1y]);
end

colorbar;

%% 以角度为横坐标展开
figure (3);
colormap jet;
hold on;
d_t = sortrows(d_t, 8);
scatter(d_t(:,8),d_t(:,4),'filled','cdata',d_t(:,4))
hold on
scatter(d_t(:,8)+ 360,d_t(:,4),'filled','cdata',d_t(:,4))
grid minor;
grid on;

for i = 1 : 3
    line([angel(i) angel(i)],[0 3.5e-4]);
    line([angel(i)+360 angel(i)+360],[0 3.5e-4]);
end

%% 画点图  有预紧
figure(5)
load bb;
d_t = sortrows(d_t, 4);

xo = -6.270e-02; yo = 1.851e-01;
d_t(:,6) = d_t(:,2) - xo;
d_t(:,7) = d_t(:,3) - yo;
d_t(:,8) = atan(d_t(:,6) ./ d_t(:,7));
    
for i = 1:length(d_t)
    d_t(i,6) = d_t(i,2) - xo;
    d_t(i,7) = d_t(i,3) - yo;
    d_t(i,8) = atan(d_t(i,6) / d_t(i,7));
    if(d_t(i,7) < 0)
        d_t(i,8) = -d_t(i,8) - pi/2;
    else
        d_t(i,8) = -d_t(i,8) + pi/2;
    end
end

d_t(:,9) = sqrt( d_t(:,6).*d_t(:,6) + d_t(:,7).*d_t(:,7));
 r=(0.044168779 + 0.0447709) / 2;
 R= (0.0473978 + 0.048042379)/2;

 d_t = d_t(find(d_t(:,9) <R) , :);
 d_t = d_t(find(d_t(:,9) >r) , :);
 
x1 = -1.177e-01 - xo;
y1 = 2.036e-01 - yo;
x2 = -7.918e-02 - xo;
y2 = 1.326e-01 - yo;
x3 = -9.183e-03 - xo;
y3 = 2.036e-01 - yo;

angel(1) = -atan(x1/y1)*180/pi + 90;
angel(2) = -atan(x2/y2)*180/pi - 90;
angel(3) = -atan(x3/y3)*180/pi + 90;

colormap jet;
grid minor;
grid on;
d_t(:,8) = d_t(:,8) .*180./pi;
d_t(:,4) = -d_t(:,4);
c = linspace(1,10,length(d_t));
scatter(d_t(:,6),d_t(:,7),3,d_t(:,4),'filled');

for i = 1 : 3
    b1x=R*cos(angel(i)*pi/180); b1y = R*sin(angel(i)*pi/180);
    line([0 b1x],[0 b1y]);
end

colorbar;
grid minor

% 单图比例
set(gcf,'Position',[100 100 370 310]);
set(gca,'Position',[.12 .1 .65 .75]);

%% O形圈侧面油压(MPa)-阀片端面受力(N)曲线
figure (6);
a=[1.71	4848.00	9525.30	14373.30;
2.66	5365.06	14801.36	20166.42;
4.08	6199.22	22732.15	28931.36;
6.22	7561.08	34611.63	42172.71;
8.47	9083.83	47133.93	56217.77;
10.72	10753.92	59656.23	70410.15;
12.97	12444.75	72178.53	84623.28;
15.00	13975.78	83481.99	97457.77;
    ];
 hold on;
plot( a(:,1), a(:,2),'-d', 'MarkerSize',10);
plot( a(:,1), a(:,3),'-s', 'MarkerSize',10);
plot( a(:,1), a(:,4),'-^', 'MarkerSize',10);
    xlabel ('O形圈侧面油液压强（MPa）');
    ylabel ('阀片端面受力（N）');
    legend('O形圈接触压力', '阀片端面油液压力', '阀片端面受力总和');
     set(gca,'FontSize',13);
     set(gca,'xtick',[1 3 5 7 9 11 13 15 17])
     set(gca,'ytick',0:20000:100000)
     xlim([1,15]);
grid on

%% 不同变形率，O形圈接触压力随油压变化
figure (7);
a=[1.71	4848.00	9525.30	14373.30;
2.66	5365.06	14801.36	20166.42;
4.08	6199.22	22732.15	28931.36;
6.22	7561.08	34611.63	42172.71;
8.47	9083.83	47133.93	56217.77;
10.72	10753.92	59656.23	70410.15;
12.97	12444.75	72178.53	84623.28;
15.00	13975.78	83481.99	97457.77;
    ];
 hold on;
 b=[1.7328	3176.199136	3165.65587663004;
4.1344	4435.637775	4398.07135291309;
8.588	7132.862102	7120.02330196141;
13.148	10309.86998	10238.9539574639;
14.9872	11609.32622	11609.3262241915;

];
 
plot( a(:,1), a(:,2),'-d', 'MarkerSize',10);
plot( b(:,1), b(:,2),'-s', 'MarkerSize',10);
plot( b(:,1), b(:,3),'-^', 'MarkerSize',10);
    xlabel ('O形圈侧面油液压强（MPa）');
    ylabel ('阀片端面受力（N）');
    legend('O形圈接触压力', '阀片端面油液压力', '阀片端面受力总和');
     set(gca,'FontSize',13);
%      set(gca,'xtick',[1 3 5 7 9 11 13 15 17])
%      set(gca,'ytick',0:20000:100000)
     xlim([1,15]);
grid on

