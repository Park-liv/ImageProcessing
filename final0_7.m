clear all 
close all

F = double(imread('house03.tif'));
[sz1, sz2] = size(F);

hx = [-1 0 1;-2 0 2;-1 0 1];
hy = hx';
[sz1_filter, sz2_filter] = size(hx);

a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

Gx = zeros(sz1, sz2);
for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + hx(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        Gx(x,y) = abs(m);
    end
end

Gy = zeros(sz1, sz2);
for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + hy(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        Gy(x,y) = abs(m);
    end
end

G = Gx + Gy;
G1 = G;
for i = 1:sz1
    for j = 1:sz2
        if G1(i,j) < 250
            G1(i,j) = 0;
        end
    end
end

colormap gray(256)
subplot(2,2,1), image(Gx)
subplot(2,2,2), image(Gy)
subplot(2,2,3), image(G)
subplot(2,2,4), image(G1)