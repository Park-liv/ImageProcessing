close all
clear all

F = double(imread('house03.tif'))/255;

[sz1, sz2] = size(F);
x_axis = [0:255];

G = zeros(sz1,sz2);
c = 1;
r = 2;
for i = 1:sz1
    for j = 1:sz2
        G(i,j) = c * (F(i,j)^(r));
    end
end

G1 = zeros(sz1,sz2);
c = 1;
r = 1/2;
for i = 1:sz1
    for j = 1:sz2
        G1(i,j) = c * (F(i,j)^(r));
    end
end

y = hist(F*255,x_axis);
z = sum(y');
y1 = hist(G*255,x_axis);
z1 = sum(y1');
y2 = hist(G1*255,x_axis);
z2 = sum(y2');

colormap gray(256)
subplot(2,3,1), image(F*255)
subplot(2,3,4), bar(x_axis,z)

subplot(2,3,2), image(G*255)
subplot(2,3,5), bar(x_axis,z1)

subplot(2,3,3), image(G1*255)
subplot(2,3,6), bar(x_axis,z2)
