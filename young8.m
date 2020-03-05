close all;

F = double(imread('lena.jpg'))/255;
[sz1, sz2, sz3] = size(F);

image(F)

X = [57 95 1; 81 165 1; 158 106 1]';
Y = [70 161 1; 148 130 1; 80 40 1]';

A = Y * X^(-1);
A_new = A^(-1);
G = zeros(sz1, sz2, sz3);

for i=1:sz1
    for j=1:sz2
        for k=1:sz3
            xy_new = A_new * [i; j; 1];
            x = xy_new(1);
            y = xy_new(2);
            if x < 1
                x = 1;
            elseif x > sz1
                x = sz1;
            else
                x = round(x);
            end
            if y < 1
                y = 1;
            elseif y > sz2
                y = sz2;
            else
                y = round(y);
            end
            G(i,j,k) = F(x,y,k);
        end
    end
end

figure
image(G)