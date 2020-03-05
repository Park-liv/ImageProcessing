close all

F = double(imread('ÆÄ¶ó¿À.jpg'))/255;
[sz1, sz2, sz3] = size(F);

sz1_new = sz2;
sz2_new = sz1;

A = [0 1 0; -1 0 0; 0 0 1];
G = zeros(sz1_new, sz2_new, 3);

image(F)

for i=1:sz1
    for j=1:sz2
        for k=1:sz3
            xy_new = A * [i; j; 1];
            x = xy_new(1);
            y = xy_new(2);
            if x < 0
                x = x + sz1_new + 1;
            end
            if y < 0
                y = y + sz2_new + 1;
            end
            G(x,y,k) = F(i,j,k);
        end
    end
end

figure
image(G)