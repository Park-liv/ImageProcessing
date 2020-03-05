% close all;

F = double(imread('lena.jpg'))/255;
[sz1, sz2, sz3] = size(F);

% image(F)

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
            end 
            if y < 1
                y = 1;
            elseif y > sz2
                y = sz2;
            end
            
            m = floor(x);
            n = floor(y);
            if (m == sz1 && n == sz2)
                G(i,j,k) = F(m,n,k);
            elseif (m == sz1 && n ~= sz2)
                f_m_y = F(m,n,k) + (F(m,n+1,k) - F(m,n,k)) * (y - n);
                
                G(i,j,k) = f_m_y;
            elseif (n == sz2 && m ~= sz1) 
                f_x_n = F(m,n,k) + (F(m+1,n,k) - F(m,n,k)) * (x - m);
                
                G(i,j,k) = f_x_n;
            else
                f_x_n = F(m,n,k) + (F(m+1,n,k) - F(m,n,k)) * (x - m);
                f_x_n1 = F(m,n+1,k) + (F(m+1,n+1,k) - F(m,n+1,k)) * (x - m);
                f_x_y = f_x_n + (f_x_n1 - f_x_n) * (y - n);
                
                G(i,j,k) = f_x_y;
            end
        end
    end
end

figure
image(G)