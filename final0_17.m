close all
clear all

F = imread('Å°º¸µå2.jpg');

[sz1, sz2, sz3] = size(F);
x_axis = [0:255];

R = uint8(zeros(sz1, sz2, sz3));
G = uint8(zeros(sz1, sz2, sz3));
B = uint8(zeros(sz1, sz2, sz3));

R(:,:,1) = F(:,:,1);
G(:,:,2) = F(:,:,2);
B(:,:,3) = F(:,:,3);

subplot(2,2,1), image(F)
subplot(2,2,2), image(R)
subplot(2,2,3), image(G)
subplot(2,2,4), image(B)

figure
for k = 1:sz3
    A = F(:,:,k);
    y = hist(A,x_axis);
    z = sum(y');
    subplot(2,2,k+1), bar(x_axis,z)
end

Th1 = 90;
% Th2 = 255;
C = F;

for i = 1:sz1
    for j = 1:sz2
        for k = 1:sz3
            if F(i,j,k) >= Th1
                C(i,j,k) = 0;
            end
        end
    end
end

yC = hist(C,x_axis);
zC = sum(yC');

figure, bar(x_axis,zC)

figure, image(C)
