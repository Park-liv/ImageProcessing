close all
clear all

% f1 = double(imread('Ganggangsullae01.tif'))/255;
% f2 = double(imread('Ganggangsullae03.tif'))/255;
f1 = double(imread('300마네.jpg'))/255;
f2 = double(imread('300살라.jpg'))/255;

A1=0;
A2=0.2;
A3=0.4;
A4=0.6;
A5=0.8;
A6=1;

g1 = (1-A1)*f1 + A1*f2;
g2 = (1-A2)*f1 + A2*f2;
g3 = (1-A3)*f1 + A3*f2;
g4 = (1-A4)*f1 + A4*f2;
g5 = (1-A5)*f1 + A5*f2;
g6 = (1-A6)*f1 + A6*f2;

% colormap gray(256)
% subplot(2,3,1), image(g1*255)
% subplot(2,3,2), image(g2*255)
% subplot(2,3,3), image(g3*255)
% subplot(2,3,4), image(g4*255)
% subplot(2,3,5), image(g5*255)
% subplot(2,3,6), image(g6*255)

subplot(2,3,1), image(g1)
subplot(2,3,2), image(g2)
subplot(2,3,3), image(g3)
subplot(2,3,4), image(g4)
subplot(2,3,5), image(g5)
subplot(2,3,6), image(g6)