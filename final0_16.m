close all
clear all

F = double(imread('rice02.tif'));

[sz1, sz2] = size(F);
x_axis = [0:255];

y = hist(F,x_axis);
z = sum(y');

colormap gray(256)
image(F)
figure, bar(x_axis,z)

Th1 = 0;
Th2 = 135;
C = F;

for i = 1:sz1
    for j = 1:sz2
        if(Th1 <= F(i,j) && F(i,j) <= Th2)
            C(i,j) = 0;
        end
    end
end

figure, colormap gray(256), image(C)