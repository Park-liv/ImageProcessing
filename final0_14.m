close all
clear all

f=double(imread('house03.tif'));
[M,N] = size(f);
xx = [0:M-1];
yy = [0:N-1];

R = M*0.1;
n = 3;

image(f), colormap gray(256), title('원본')

for x=0:M-1
    for y=0:N-1
        f(x+1,y+1) = f(x+1,y+1)*(-1)^(x+y);
    end
end

F = 1/M/N*fft2(f);

for u=0:M-1
    for v=0:N-1
        G(u+1,v+1) = F(u+1,v+1) / (1 + (R / (sqrt((u-M/2)^2 + (v-N/2)^2)))^(2*n));
    end
end

g = M*N*ifft2(G);

for x=0:M-1
    for y=0:N-1
        g(x+1,y+1) = g(x+1,y+1)*(-1)^(x+y);
    end
end

figure
image(g), colormap gray(256), title('고주파통과')