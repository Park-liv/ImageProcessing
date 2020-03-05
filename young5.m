close all
clear all

F = double(imread('ÆÄ¶ó¿À.jpg'))/255;
[sz1, sz2, sz3] = size(F);
S = 2;

sz1_new = round(sz1*S);
sz2_new = round(sz2*S);

G = zeros(sz1_new, sz2_new, 3);

image(F)
for i=1:sz1_new
    for j=1:sz2_new
        for k=1:sz3
            G(i,j,k) = 0.5;
        end
    end
end
figure , image(G)


for i=1:sz1_new
    for j=1:sz2_new
        for k=1:sz3
            I = round(i/S);
            J = round(j/S);
            if I < 1
                I = 1;
            end
            if J < 1
                J = 1;
            end
            G(i,j,k) = F(I,J,k);
        end
    end
end

figure , image(G)

S_1 = 3;
sz1_new_1 = round(sz1*S_1);
sz2_new_1 = round(sz2*S_1);
G1 = zeros(sz1_new_1, sz2_new_1, 3);

for i=1:sz1_new_1
    for j=1:sz2_new_1
        for k=1:sz3
            I = round(i/S_1);
            J = round(j/S_1);
            if I < 1
                I = 1;
            end
            if J < 1
                J = 1;
            end
            G1(i,j,k) = F(I,J,k);
        end
    end
end

figure , image(G1)

S_2 = 1/6;
sz1_new_2 = round(sz1*S_2);
sz2_new_2 = round(sz2*S_2);
G2 = zeros(sz1_new_2, sz2_new_2, 3);

for i=1:sz1_new_2
    for j=1:sz2_new_2
        for k=1:sz3
            I = i/S_2;
            J = j/S_2;
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

            G2(i,j,k) = F(I,J,k);
        end
    end
end

figure , image(G2)