clear all;
clc;

I = imread("DIP_2019_A4/coins.jpg");

A = imbinarize(I);

[label_img, k] = CCL(A);
[a,b] = size(A);
labels = unique(label_img);

% cc = hsv(k);
% [a,b] = size(A);
% labels = unique(label_img);
% 
% final = zeros(a,b,3);
% 
% for i=1:a
%     for j=1:b
%         for p=1:k
%             if label_img(i,j) == labels(p) && labels(p) ~= 0
%                final(i,j,:) = cc(p, :); 
%             end
%         end
%     end
% end
% 
% imshow(final)


border_labels = [];

for i=2:k
    temp = label_img == labels(i);
    if any(temp(1,:)) || any(temp(:,1)) || any(temp(a,:)) || any(temp(:,b))
        border_labels = [border_labels, labels(i)];
    end
end

overlapping_labels= [];
nonoverlapping_labels = [];

for i=2:k
    temp = label_img == labels(i);
    if sum(sum(temp)) > 420
        overlapping_labels = [overlapping_labels, labels(i)];
    else
        nonoverlapping_labels = [nonoverlapping_labels, labels(i)];
    end
end

[~, a1] = size(border_labels);
[~, a2] = size(overlapping_labels);
[~, a3] = size(nonoverlapping_labels);

I5 = zeros([a,b]);
for i=1:a1
    temp = label_img == border_labels(i);
    I5 = I5 + temp;
end

I6 = zeros([a,b]);
for i=1:a2
    temp = label_img == overlapping_labels(i);
    I6 = I6 + temp;
end

I7 = zeros([a,b]);
for i=1:a3
    temp = label_img == nonoverlapping_labels(i);
    I7 = I7 + temp;
end
