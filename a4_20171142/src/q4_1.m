clear all;
clc;

I = imread("DIP_2019_A4/objects.png");
[a,b] = size(I);

A1 = imbinarize(I);
A2 = imfill(A1, 'holes');

% Part1

[label_img1, k1] = CCL(A1);
[label_img2, k2] = CCL(A2);

labels1 = unique(label_img1);
labels2 = unique(label_img2);

count1 = zeros(k1);
count2 = zeros(k2);

for i=1:k1
    temp = label_img1 == labels1(i);
    count1(i) = sum(sum(temp));
end

for i=1:k2
    temp = label_img2 == labels2(i);
    count2(i) = sum(sum(temp));
end

holes_labels = [];
for i=1:k1
    if count1(i) < count2(i)
        holes_labels = [holes_labels, labels1(i)];
    end
end

[~, a1] = size(holes_labels);

I1 = zeros([a,b]);
for i=1:a1
    temp = label_img1 == holes_labels(i);
    I1 = I1 + temp;
end

[~, count] = size(holes_labels);

