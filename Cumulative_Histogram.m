clc
clear

i = imread('cameraman.tif');

h = imhist(i);

cumhist = zeros(size(h));

cumhist(1) = h(1);
for k = 2:256
    cumhist(k) = cumhist(k-1) + h(k);
end
cumhist = cumhist / cumhist(256);

bar(cumhist)