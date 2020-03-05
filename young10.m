close all
clear all

F = double(imread('lena.jpg'))/255;
[sz1, sz2, sz3] = size(F);

image(F)

X_F = [30 44; 29 183; 112 45; 104 58; 171 59; 178 174];
X_G = [10 10; 29 183; 112 45; 104 58; 171 59; 178 174];
szF = size(X_F);

for n = 1:szF(1)
    x_G = X_G(n,1);
    y_G = X_G(n,2);
    Z(n,:) = [x_G^2 y_G^2 x_G*y_G x_G y_G 1];
end

x_F = X_F(:,1);
y_F = X_F(:,2);

a = Z^(-1) * x_F;
b = Z^(-1) * y_F;

G = zeros(sz1,sz2,sz3);

for i = 1:sz1
    for j = 1:sz2
        for k = 1:sz3
            x = a(1)*i^2 + a(2)*j^2 + a(3)*i*j + a(4)*i + a(5)*j + a(6);
            y = b(1)*i^2 + b(2)*j^2 + b(3)*i*j + b(4)*i + b(5)*j + b(6);
            
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
            elseif (m ~= sz1 && n == sz2) 
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