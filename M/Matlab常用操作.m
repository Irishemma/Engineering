
clc;  clear;
close all;
hold on;
grid minor;
grid on;

d_t = calP('abaqus-ex4-28.rpt');

%%  对矩阵的某一列排序
%     d_t = sortrows(d_t, 2);

%%  画等高线图
%     XI = min(d_t(:,2)) :(max(d_t(:,2))-min(d_t(:,2)))/100 : max(d_t(:,2));
%     YI = min(d_t(:,3)) :(max(d_t(:,3))-min(d_t(:,3)))/100 : max(d_t(:,3));
%     [XI,YI] = meshgrid(XI,YI);
%     ZI = griddata(d_t(:,2), d_t(:,3), d_t(:,4), XI,YI,'v4');
%     pcolor 画等高线图

%%  将直角坐标转换为相对于O点的极坐标,角度为c
%     xo = -6.270e-02; yo = 1.851e-01;
%     a = x - xo;
%     b = y - yo;
%     c = atan(a/b);
%     if(b < 0)
%         c = -c - pi/2;
%     else
%         c = -c + pi/2;
%         r = (x-x0)/cos(c)

%%  用不同颜色标记值的点图
%     scatter(x,y,'filled','cdata',z);
%     scatter(x,y,'filled','cdata',y);
%     line([x x],[0 3.5e7]);

%%  打开多个画图文件
%     figure (1);

%%  快速切换代码
%     ch = 0;
%     switch ch    
%         case 0
%     end

%%  读取O型圈压强，用不同颜色标记不同区域
%     d_t = calP('abaqus-ex4-28.rpt');
%     d_t = sortrows(d_t, 2);
%     mid(1) = find(d_t==3578456);
%     left_t = d_t(1:mid,:);
%     right_t = d_t(mid:length(d_t),:);
%     plot ( left_t(:,2), left_t(:,3), 'bs-' );
%     plot ( right_t(:,2), right_t(:,3), 'rs-' );
%     max(d_t(:,3))

%%  x，y轴标签， 曲线说明标签 ，字体大小， x轴起点， 工具箱拟合， 以拟合参数计算y
%     xlabel ('变形率（%）');
%     ylabel ('峰值压强（MPa）');
%     legend('Lindley 经验值', 'FEA 阀片边', 'FEA O形圈边');
%      set(gca,'FontSize',15);
%      set(gca,'xtick',0:1:8)
%      set(gca,'ytick',0:0.5:4)
%      fitValue = polyfit(d(:,4), d(:,5), 1);
%      x=0.1:0.002:0.9;
%      TEST = polyval(fitValue,x);

%%  邵氏硬度转弹性模量
%     Hs = [70:0.05:90];
%     E  = (15.75 + 2.15 .* Hs) ./ (100 - Hs);
%     plot (Hs, E);

%%  与ABAQUS联合
%     %% 产生输入集
%     N = 50;
%     boltPress = zeros(12,N);
%     n = 1;
%     for i = 1 : 12
%         boltPress( i, n ) = 8e-5;
%     end
% 
%     %%  改写py文件
%     ns = num2str(n);
%     ns = [ 'main_', ns, '.py' ];
% 
%     % mainRes.py  main_n.py
%     fixPy( 'mainRes.py', ns, boltPress(:,n), n);
% 
%     %%  提交abaqus计算
%     cd ('\.');
%     % main_n.py
%     system( ['abaqus cae script=main_', num2str(n), '.py'] );
% 
%     %%  后处理






