clear all 
close all

F = double(imread('man01.tif'));
[sz1, sz2] = size(F);

h = ones(3,3)/9;
[sz1_filter, sz2_filter] = size(h);

a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

G = zeros(sz1, sz2);
for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + h(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        G(x,y) = m;
    end
end

h = ones(5,5)/25;
[sz1_filter, sz2_filter] = size(h);

a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

G1 = zeros(sz1, sz2);
for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + h(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        G1(x,y) = m;
    end
end

h = ones(7,7)/49;
[sz1_filter, sz2_filter] = size(h);

a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

G2 = zeros(sz1, sz2);
for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + h(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        G2(x,y) = m;
    end
end

colormap gray(256)
subplot(2,2,1), image(F)
subplot(2,2,2), image(G)
subplot(2,2,3), image(G1)
subplot(2,2,4), image(G2)