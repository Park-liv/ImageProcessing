close all
clear all

Mane1=double(imread('300마네.jpg'))/255;
Mane2=double(imread('300마네별.jpg'))/255;

J=Mane2-Mane1;

subplot(2,2,1), image(Mane1)
subplot(2,2,2), image(Mane2)
subplot(2,2,3), image(J)


[sz1,sz2,sz3]=size(J);
for i=1:sz1
    for j=1:sz2
        for k=1:sz3
            if J(i,j,k)<0.1
                J(i,j,k)=0;
            else
                J(i,j,k)=1;
            end
        end
    end
end
subplot(2,2,4), image(J)