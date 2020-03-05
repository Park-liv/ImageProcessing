close all
clear all

colormap gray(2)

f1 = boolean(imread('Ganggangsullae03.tif'));
f2 = boolean(imread('mask_circle02.tif'));

J1 = ~f1;
J2 = f1 & f2;
J3 = f1 | f2;
J4 = xor(f1,f2);
J5 = ~f1 & f2;
J6 = ~f1 | f2;
J7 = xor(~f1,f2);

subplot(3,3,1), image(f1)
subplot(3,3,2), image(f2)
subplot(3,3,3), image(J1)
subplot(3,3,4), image(J2)
subplot(3,3,5), image(J3)
subplot(3,3,6), image(J4)
subplot(3,3,7), image(J5)
subplot(3,3,8), image(J6)
subplot(3,3,9), image(J7)