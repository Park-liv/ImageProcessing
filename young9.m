% 1차 보간 식
clear all
clear all

m = 2;
n = 2;
x = 2.7;
y = 2.7;
f_m_n = 180;
f_m_n1 = 280;
f_m1_n = 170;
f_m1_n1 = 200;

f_x_n = f_m_n + (f_m1_n - f_m_n) * (x - m)
f_x_n1 = f_m_n1 + (f_m1_n1 - f_m_n1) * (x - m)
f_x_y = f_x_n + (f_x_n1 - f_x_n) * (y - n)

% f_x_n = F(m,n,k) + (F(m+1,n,k) - F(m,n,k)) * (x - m);
% f_m_y = F(m,n,k) + (F(m,n+1,k) - F(m,n,k)) * (y - n);
% f_x_n1 = F(m,n+1,k) + (F(m+1,n+1,k) - F(m,n+1,k)) * (x - m);
% f_x_y = f_x_n + (f_x_n1 - f_x_n) * (y - n);