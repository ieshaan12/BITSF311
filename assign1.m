clc;
close all;
clear all;
img = imread('assign.bmp','bmp');
img = double(img);
%imshow(img,[]);
[m,n] = size(img);
for i = 1:m
    for j = 1:n
        img(i,j) = img(i,j)*((-1)^(i+j)); 
    end
end

img2 = fft2(img);
res = zeros(m,n);
res(m/2-25:m/2+25,n/2-25:n/2+25) = 1;
result = zeros(m,n);
%imshow(res,[]);

for i = 1:m
    for j = 1:n
        result(i,j) = img2(i,j).*(res(i,j)); 
    end
end

final = ifft2(result);
final = real(final);
final2 = zeros(m,n);

for i = 1:m
    for j = 1:n
        final2(i,j) = final(i,j)*((-1)^(i+j)); 
    end
end

imshow(uint8(final2),[]);



