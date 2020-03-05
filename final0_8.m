clear all
close all

M = 256;
x = [0:M-1];
fx = 128 + 127 * sin((2 * 20 * pi * x) / 256); 
plot(x,fx);
grid on

for u = -(M/2-1):M/2
    m = 0;
    for x = 0:M-1
        m = m + fx(x+1) * exp((-j*2*pi*u*x)/M);
    end
    fu(u+M/2) = m / M;
end

figure
u = -(M/2-1):M/2;
plot(u,abs(fu))