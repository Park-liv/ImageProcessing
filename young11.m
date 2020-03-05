close all
clear all

F = (imread('boy06.tif'));

[sz1, sz2] = size(F);

G = zeros(sz1,sz2);
for i = 1:sz1
    for j = 1:sz2
        G(i,j) = 255 - F(i,j);
    end
end
% G = 255 - F; 이 식도 가능

colormap gray(256)
image(F)
figure
colormap gray(256)
image(G)