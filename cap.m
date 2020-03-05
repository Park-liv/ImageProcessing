clear all
close all

F=imread('¼÷Á¦.jpg');
[sz1, sz2, sz3] = size(F);

for i = 1:sz1
    for j = 1:sz2
        for k = 1:sz3
            if i >= 280
                F(i,j,k) = 255;
            end
        end
    end
end
image(F)

imwrite(F,'º¯ÇüµÈ¼÷Á¦.jpg')