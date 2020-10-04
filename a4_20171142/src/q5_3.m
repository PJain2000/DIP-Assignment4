clear all;
clc;

I = rgb2gray(imread("DIP_2019_A4/q5_3.jpeg"));

I1 = imbinarize(I, 0.8);
I1 = imcomplement(I1);
% I1 = I1(66:287, 54:476);
% imshow(I1)


[a,b] = size(I1);

[label_img, k] = CCL(I1);

labels = unique(label_img);
label_1hole = [];
label_2hole = [];


for i=2:k
    P = label_img == labels(i);
    Q = imfill(P, 'holes');
    P = Q-P;
%     P = imcomplement(P);
    
    [label1, k1] = CCL(P);

    if k1 == 1
        label_1hole = [label_1hole, labels(i)];
    elseif k1 == 2
        label_2hole = [label_2hole, labels(i)]; 
    end
end

[~,a1] = size(label_1hole);
[~,a2] = size(label_2hole);

I5 = zeros([a,b]);
for i=1:a1
    temp = label_img == label_1hole(i);
    I5 = I5 + temp;
end

I6 = zeros([a,b]);
for i=1:a2
    temp = label_img == label_2hole(i);
    I6 = I6 + temp;
end
