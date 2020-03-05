close all
clear all

F = double(imread('house03.tif'))/255;

[sz1, sz2] = size(F);

G = zeros(sz1,sz2);
c = 1.5;
r = 3;
for i = 1:sz1
    for j = 1:sz2
        G(i,j) = c * (F(i,j)^(r));
    end
end

colormap gray(256)
image(F*255)
figure
colormap gray(256)
image(G*255)