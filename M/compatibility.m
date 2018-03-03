clc; clear;
syms Lb Eb Sb Lf Ef Sf TaoP

Lb = 40
Eb = 2e5
Sb = 3*pi*5*5       % 这里已经 x3了
Lf = 40
Ef = 2e5
Sf = 8719.36+3019.99

Ff = 90000
Fo = 3883.24


% Solve(' ( (Lb-TaoP) / (Eb*Sb) + Lf/(Ef * Sf) ) * ( Ff+Fo ) + 3.55 - 2.8 - TaoP ')

Ff = Ff + Fo
A = 1+Ff/(Eb*Sb)
B = ( Lb / (Eb*Sb)+ Lf/(Ef * Sf) )*  Ff  + 3.55 - 2.8

TaoP = B/A

Sf = pi*42.0897^2

( Lb/(Eb*Sb) + Lf/(Ef*Sf) ) * 179090  % ans=0.1585
% 计算得到taoP = 0.1585+0.73=
% tao = 0.8885 / 1.5 = 0.5923   即为33.96°