close all
clear all

colormap gray(256)
f1=double(imread('Ganggangsullae01.tif'))/255;
f2=double(imread('mask_circle.tif'))/255;

[sz1,sz2,sz3]=size(f2);
f3 = ones(sz1,sz2,sz3) - f2;

G=f1.*f3;
image(G*255)