close all
clear all

f=double(imread('house03.tif'));
[M,N] = size(f);
xx = [0:M-1];
yy = [0:N-1];

R = M*0.2; %반지름

image(f), colormap gray(256), title('원본')

for x=0:M-1
    for y=0:N-1
        f(x+1,y+1) = f(x+1,y+1)*(-1)^(x+y);
    end
end

F = 1/M/N*fft2(f);

H = zeros(M,N);
for u=-(M/2-1):M/2
    for v=-(N/2-1):N/2
        if sqrt(u^2+v^2) <= R
            H(u+M/2,v+N/2) = 1;
        end
    end
end
G = F.*H;

g = M*N*ifft2(G);

for x=0:M-1
    for y=0:N-1
        g(x+1,y+1) = g(x+1,y+1)*(-1)^(x+y);
    end
end

figure
image(H*255), colormap gray(256)
figure
image(abs(g)), colormap gray(256), title('저주파통과')