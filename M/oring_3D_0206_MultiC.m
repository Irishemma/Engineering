%% 求解3D O型圈上的总压力

clc;  clear;
close all;
% hold on;
% grid minor;
% grid on;
d_t = calP('abaqus-15-16.rpt');
d_t = sortrows(d_t, 2);
% d_t(6,:) = [];
% d_t = d_t(5:125,:);
d_t(:,2) = d_t(:,2) -47.4087 + 1.6837;
% 总压力求和
%外半径47.4087，内半径44.7789，宽度2.6298
% R = -47.4088; r = -44.7788;
R = min(d_t(:,2)); r = max(d_t(:,2));
N = 25;
deltaR = (r-R)/N;
p = zeros(N,1);
num = zeros(N,1);
S = zeros(N,1);
F = 0;
for i = 1 : N
    Ri = R + deltaR * i - deltaR;
    ri = Ri + deltaR;
    S(i) = -pi * (Ri*Ri - ri*ri);
    win = find( (d_t(:,2) >= Ri) & (d_t(:,2) <= ri) );
    num(i) = length(win);
    for j = 1 : length(win)
        p(i) = p(i) + d_t(win(j),4);
    end
    p(i) = p(i) / length(win);
    F = F + p(i) * S(i);
end
F = -F
b = r-R
R
% F = 23841.92N
plot(d_t(:,2), d_t(:,4));


% 
% sum1 = 0;
% sum2 = 0;
% sum3 = 0;
% for i = 1: length(d_t)-1
%     sum1 = sum1 + (d_t(i+1,2) - d_t(i,2)) * d_t(i,4);
%     sum2 = sum2 + (d_t(i+1,2) - d_t(i,2)) * d_t(i+1,4);
%     sum3 = sum3 + (d_t(i+1,2) - d_t(i,2)) * (d_t(i+1,4)+d_t(i,4))/2;
% end