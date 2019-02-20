clc
clear
close all

img = imread('cameraman.tif');

[num_of_rows, num_of_clmns, num_of_plts] = size(img);

if num_of_plts>1
    img = rgb2gray(img);
end

hist_of_img = zeros(256,1);
for intensit_level=0:255
    hist_of_img(intensit_level+1) = sum(img(:)==intensit_level);
end

figure(1);
subplot(2,2,1);
bar(hist_of_img);
title('my hist')

matlab_hist = imhist(img);

subplot(2,2,2);
bar(matlab_hist);
title('matlab hist')

bins = 10;
k = 1;
bins_hist_of_img = zeros(size(0:bins:255));
for intensit_level=0:bins:255
    cnd = (img(:)>intensit_level) .* (img(:)<intensit_level+bins);
    bins_hist_of_img(k) = sum(cnd);
    k=k+1;
end

subplot(2,2,3);
bar(bins_hist_of_img);
title('my bins hist')

log_hist_of_img = log(1+hist_of_img);

subplot(2,2,4);
bar(log_hist_of_img);
title('my log hist')



