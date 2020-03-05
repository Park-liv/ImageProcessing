close all

F = double(imread('liv.jpg'))/255;
[sz1, sz2, sz3] = size(F);

sz1_new = 2 * sz1;
sz2_new = 2 * sz2;

delta_x = round(sz1/2);
delta_y = round(sz2/2);

A = [1 0 delta_x;0 1 delta_y;0 0 1];
G = zeros(sz1_new, sz2_new, 3);

for i=1:sz1
    for j=1:sz2
        for k=1:sz3
            xy_new = A * [i; j; 1];
            x = xy_new(1);
            y = xy_new(2);
            G(x,y,k) = F(i,j,k);
        end
    end
end

image(G)