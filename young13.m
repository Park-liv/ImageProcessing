close all;
clear;

F = double(imread('tomato01.tif'))/255;
[sz1, sz2] = size(F);

a = 0.2;
b = 0.7;
c = 0.1;
d = 0.8;

G = zeros(sz1,sz2);
for i = 1:sz1
    for j = 1:sz2;
        if F(i,j) <= a
            G(i,j) = (c/a) * F(i,j);
        elseif (F(i,j) > a) && (F(i,j) <= b)
            G(i,j) = ((d - c)/(b - a)) * (F(i,j) - a) + c;
        else
            G(i,j) = ((1 - d)/(1 - b)) * (F(i,j) - 1) + 1;
%             G(i,j) = ((1 - d)/(1 - b)) * (F(i,j) - b) + d; 위 식과 같음
        end
    end
end

x = [0:255];

y1 = hist(F*255,x);
z1 = sum(y1');
y2 = hist(G*255,x);
z2 = sum(y2');

colormap gray(256)
subplot(2,2,1), image(F*255)
subplot(2,2,2), image(G*255)
subplot(2,2,3), bar(x,z1,'b')
subplot(2,2,4), bar(x,z2,'b')
