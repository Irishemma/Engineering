%% 求解3D O型圈上的总压力

clc;  clear;
close all;
hold on;
grid minor;
grid on;

d_t = calP('abaqus-ex4-28.rpt');
d_t = sortrows(d_t, 2);

% 总压力求和
sum1 = 0;
sum2 = 0;
sum3 = 0;
for i = 1: length(d_t)-1
    sum1 = sum1 + (d_t(i+1,2) - d_t(i,2)) * d_t(i,4);
    sum2 = sum2 + (d_t(i+1,2) - d_t(i,2)) * d_t(i+1,4);
    sum3 = sum3 + (d_t(i+1,2) - d_t(i,2)) * (d_t(i+1,4)+d_t(i,4))/2;
end