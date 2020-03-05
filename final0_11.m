close all
clear all

f=double(imread('rectangle06.tif'));
[M,N] = size(f);
xx = [0:M-1];
yy = [0:N-1];
image(f), colormap gray(256)

for x=0:M-1
    for y=0:N-1
        f(x+1,y+1) = f(x+1,y+1)*(-1)^(x+y);
    end
end

F = 1/M/N*fft2(f);
G = 255/max(max(abs(F)))*abs(F);

C = 255/log10(1+max(max(abs(F))));
G_1 = C * log10(1+abs(F));
% for u=0:M-1
%     for v=0:N-1
%         G(u+1,v+1) = C * log(1+abs(F(u+1,v+1)));
%     end
% end

figure
image(G), colormap gray(256)
figure
image(G_1), colormap gray(256)
