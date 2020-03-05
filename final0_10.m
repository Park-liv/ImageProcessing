clear all
close all

M = 128;
N = 128;
xx = [0:M-1];
yy = [0:N-1];

for x = 0:M-1
    for y = 0:N-1
        f(x+1,y+1) = 128 + 127*sin(2*pi *(5*x/M + 10*y/N));
    end
end

for u = -(M/2-1):M/2
    for v = -(N/2-1):N/2
        m = 0;
        for x = 0:M-1
            for y = 0:N-1
                m = m + f(x+1,y+1) * exp(-j*2*pi*(u*x/M + v*y/N));
            end
        end
        F(u+M/2,v+N/2) = m / (M*N);
    end
end

figure
image(f), colormap gray(256)
figure
image(abs(F)), colormap gray(256)