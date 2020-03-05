close all
clear all

f = [17 24 1 8 15; 23 5 7 14 16; 4 6 13 20 22; 10 12 19 21 3; 11 18 25 2 9];
h = [-1 0 1; -2 0 2; -1 0 1];

[sz1, sz2] = size(f);
[sz1_filter, sz2_filter] = size(h);

a = (sz1_filter - 1)/2;
b = (sz2_filter - 1)/2;

offset1 = a + 1;
offset2 = b + 1;

g = zeros(sz1, sz2);
for x = 1:sz1
    for y = 1:sz2
        m = 0;
        for s = -a:a
            for t = -b:b
                if (x+s >=  1) && (x+s <= sz1) && (y+t >= 1) && (y+t <= sz2)
                    m = m + h(-s + offset1, -t + offset2) * f(x + s, y + t);
                end
            end
        end
        g(x,y) = m;
    end
end
g