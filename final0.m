clear all 
close all

F = imread('tomato01.tif');
[sz1, sz2] = size(F);

x_axis = [0:255];
Y = hist(F, x_axis);
Z = sum(Y');

temp = 0;
for i = 1:length(Z)
    temp = temp + Z(i);
    sum_Z(i) = temp;
end
F_cdf = sum_Z / (sz1 * sz2);

% bar(x_axis, Z)
% figure
% plot(x_axis,F_cdf)
% grid on

G = zeros(sz1, sz2);
for i = 1:sz1
    for j = 1:sz2
       m = F(i,j);
       G(i,j) = F_cdf(m+1) * (length(Z) - 1);
    end
end

Y_G = hist(G,x_axis);
Z_G = sum(Y_G');
temp = 0;
for i = 1:length(Z_G)
    temp = temp + Z_G(i);
    sum_Z_G(i) = temp;
end
G_cdf = sum_Z_G / (sz1 * sz2);

colormap gray(256)
subplot(2,3,1), image(F)
subplot(2,3,2), bar(x_axis, Z)
subplot(2,3,3), plot(x_axis,F_cdf) ,grid on
subplot(2,3,4), image(G)
subplot(2,3,5), bar(x_axis, Z_G)
subplot(2,3,6), plot(x_axis,G_cdf) ,grid on
