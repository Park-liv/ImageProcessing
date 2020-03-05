close all
clear all

F = imread('Ű����2.jpg');
[sz1, sz2, sz3] = size(F);
x_axis = [0:255];
image(F)

%%%%%%%%%%%%%%RGB ������׷����� ���ΰ� �����ϱ�%%%%%%%%%%%%%%
figure
for k = 1:sz3
    A = F(:,:,k);
    y = hist(A,x_axis);
    z = sum(y');
    subplot(1,3,k), bar(x_axis,z)
end

%%%%%%%%%%%%%%%����̹��� ������ ����%%%%%%%%%%%%%%
B = imread('liv.jpg');
[B_sz1, B_sz2, B_sz3] = size(B);

Sx = sz1/B_sz1;
Sy = sz2/B_sz2;

sz1_new = round(B_sz1*Sx);
sz2_new = round(B_sz2*Sy);
new_B = zeros(sz1_new, sz2_new, B_sz3);

for i=1:sz1_new
    for j=1:sz2_new
        for k=1:B_sz3
            I = round(i/Sx);
            J = round(j/Sy);
            if I < 1
                I =  1;
            elseif I > sz1
                I = sz1;
            end  
            if J < 1
                J = 1;
            elseif J > sz2
                J = sz2;
            end
            new_B(i,j,k) = B(I,J,k);
        end
    end
end

%%%%%%���ΰ� ������ 0��� ����̹��� �� �ֱ�%%%%%%%%
Th1 = 140;
Th2 = 255;
C = F;

for i = 1:sz1
    for j = 1:sz2
        for k = 1:sz3
            if(Th1 <= F(i,j,k) && F(i,j,k) <= Th2)
                C(i,j,k) = new_B(i,j,k);
            end
        end
    end
end

figure, image(C)