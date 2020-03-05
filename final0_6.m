clear all 
close all

F = double(imread('man01.tif'));
[sz1, sz2] = size(F);
k = [0.2 0.6 1];

h = ones(5,5);
[sz1_filter, sz2_filter] = size(h);
H = h / (sz1_filter * sz2_filter);

a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

Low = zeros(sz1, sz2);
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
        Low(x,y) = m;
        if Low(x,y) < 0
            Low(x,y) = 0;
        end
    end
end

colormap gray(256)
subplot(2,2,1), image(F)
for i = 1:length(k)
    G = F - (k(i) * Low);
    subplot(2,2,1+i), image(G)
end
