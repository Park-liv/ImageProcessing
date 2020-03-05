close all
clear all

thr = 60;
F = double(imread('boy02.tif'));
[sz1, sz2] = size(F);

image(F), colormap gray(256)

[y,x] = getpts;
x_init = round(x);
y_init = round(y);

neigb = [-1 0; 1 0; 0 -1; 0 1];
R_list = zeros(sz1*sz2, 2);
member_check = zeros(sz1, sz2);
num_pnt_list = 0;
num_pnt_checked = 0;
ref_value = F(x_init, y_init);

R_list(1,:) = [x_init, y_init];
num_pnt_list = 1;

for i=1:length(neigb)
    x_cur = x_init + neigb(i,1);
    y_cur = y_init + neigb(i,2);
    if (x_cur > 0 && y_cur > 0) && (x_cur <= sz1 && y_cur <= sz2)  %ÀÌ¿ô ÁÂÇ¥°¡ °ø°£À» ¹þ¾î³ª´ÂÁö
        if(abs(F(x_cur,y_cur) - ref_value) <= thr && member_check(x_cur,y_cur) == 0)
            num_pnt_list = num_pnt_list + 1;
            R_list(num_pnt_list, :) = [x_cur,y_cur];
            member_check(x_cur,y_cur) = 1;
        end
    end
end
num_pnt_checked = 1;

while(num_pnt_list > num_pnt_checked)
    x_init = R_list(num_pnt_checked+1, 1);
    y_init = R_list(num_pnt_checked+1, 2);
    for i=1:length(neigb)
        x_cur = x_init + neigb(i,1);
        y_cur = y_init + neigb(i,2);
        if (x_cur > 0 && y_cur > 0) && (x_cur <= sz1 && y_cur <= sz2)
            if (abs(F(x_cur,y_cur) - ref_value) <= thr && member_check(x_cur,y_cur) == 0)
                num_pnt_list = num_pnt_list + 1;
                R_list(num_pnt_list, :) = [x_cur,y_cur];
                member_check(x_cur,y_cur) = 1;
            end
        end
    end
    num_pnt_checked = num_pnt_checked + 1;
end

C = member_check .* F;

figure, image(C), colormap gray(256)