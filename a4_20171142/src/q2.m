clear all;
clc;

I = imread("DIP_2019_A4/kidney.jpg");
BW = imbinarize(I,0.515);
% imshow(BW)

SE1 = strel('disk', 2);
I1 = imclose(BW, SE1);

SE2 = strel('disk', 9);
A = imopen(I1, SE2);
% imshow(I2);

% A = randi([0,1], 50,60);
% 
% A = padarray(A, [1,1], 'both');
% [k ,label, linked, new_linked] = ccl(A);
[label_img, k] = CCL(A);

cc = hsv(k);
[a,b] = size(A);
labels = unique(label_img);

final = zeros(a,b,3);

for i=1:a
    for j=1:b
        for p=1:k
            if label_img(i,j) == labels(p) && labels(p) ~= 0
               final(i,j,:) = cc(p, :);
            end
        end
    end
end

imshow(final);