close all
clear all

A=randi([0,255],10,10,3,'double');
image(A)

figure
B=rand(10,10,3);
image(B)

figure
colormap gray(256)
C=randi([0,255],10,10,'uint8');
image(C)

figure
colormap gray(256)
D=rand(10,10);
image(D)

figure
colormap gray(256)
E=uint8(rand(10,10)*255);
image(E)