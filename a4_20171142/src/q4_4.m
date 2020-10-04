clear all;
clc;

I = imread("DIP_2019_A4/objects.png");
[a,b] = size(I);

A1 = imbinarize(I);

s = [0,0,0; 0,1,1; 0,1,1];

Acorners = doit(s, A1);
[label_img, k] = CCL(A1);

T = Acorners.*label_img;
labels = unique(T);

[a1, ~] = size(labels);

I1 = zeros([a,b]);
for i=2:a1
    temp = label_img == labels(i);
    I1 = I1 + temp;
end

I2 = A1 - I1;

A1 = imbinarize(I2);
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

[~, a3] = size(holes_labels);

I3 = zeros([a,b]);
for i=1:a3
    temp = label_img1 == holes_labels(i);
    I3 = I3 + temp;
end

I4 = I2 - I3;
[~, count] = size(holes_labels);

function p = doit(m1, dup)
%     p = dup;
    [a,b] = size(dup);
    p = zeros([a,b]);
    for i=2:a-1
        for j=2:b-1 
            if match(m1, dup(i-1:i+1, j-1:j+1))
                p(i,j) = 1;
            end
        end
    end
end


function b = match(m1, m2)
    a = 0;
    for i=1:3
        for j=1:3
            if m1(i,j) == m2(i,j)
                a = a + 1;
            end
        end
    end
    if (a == 9)
        b = 1;
    else
        b = 0;
    end
end