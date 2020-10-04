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