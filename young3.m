close all
clear all

l=double(imread('300¸¶³×.jpg'))/255;
[sz1,sz2,sz3]=size(l);
variance = 0.05;
num = 100;
for it=1:num
    J(:,:,:,it)= l + randn(sz1,sz2,sz3)*sqrt(variance);
end

image(J(:,:,:,1))

J1=zeros(sz1,sz2,sz3);
for i=1:2
    J1 = J1 + J(:,:,:,i);
end
figure
image(J1/2)

J2=zeros(sz1,sz2,sz3);
for i=1:10
    J2 = J2 + J(:,:,:,i);
end
figure
image(J2/10)

J3=zeros(sz1,sz2,sz3);
for i=1:num
    J3 = J3 + J(:,:,:,i);
end
figure
image(J3/num)