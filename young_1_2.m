clear all
close all

A=imread('파라오.jpg');
[k,l,m]=size(A);
R=uint8(zeros(k,l,m));
G=uint8(zeros(k,l,m));
B=uint8(zeros(k,l,m));

R(:,:,1)=A(:,:,1);
G(:,:,2)=A(:,:,2);
B(:,:,3)=A(:,:,3);

subplot(2,2,1), image(A)
subplot(2,2,2), image(R)
subplot(2,2,3), image(G)
subplot(2,2,4), image(B)

imwrite(R,'빨간살라.jpg')