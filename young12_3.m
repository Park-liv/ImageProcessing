close all;
clear;

F = imread('tomato01.tif');
x_axis = [0:255];

y1 = hist(F,x_axis);
z = sum(y1');

colormap gray(256)
image(F)
figure
bar(x_axis,z)