clear all 
close all

F = double(imread('man01.tif'));
[sz1, sz2] = size(F);

h = zeros(5,5);
d = 1;
[sz1_filter, sz2_filter] = size(h);
a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

for i = -a:a
    for j = -b:b
        h(i + offset1,j + offset2) = exp(-1 * ((i^2 + j^2) / (2 * d^2)));
    end
end

H = h/sum(sum(h));

G = zeros(sz1, sz2);

for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + H(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        G(x,y) = m;
    end
end

h1 = zeros(5,5);
d = 10;
[sz1_filter, sz2_filter] = size(h1);
a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

for i = -a:a
    for j = -b:b
        h1(i + offset1,j + offset2) = exp(-1 * ((i^2 + j^2) / (2 * d^2)));
    end
end

H1 = h1/sum(sum(h1));

G1 = zeros(sz1, sz2);

for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1 && x+s <= sz1) && (y+t >= 1 && y+t <= sz2)
                    m = m + H1(-s + offset1, -t + offset2) * F(x + s, y + t);
                end
            end
        end
        G1(x,y) = m;
    end
end

colormap gray(256)
subplot(1,3,1), image(F)
subplot(1,3,2), image(G)
subplot(1,3,3), image(G1)