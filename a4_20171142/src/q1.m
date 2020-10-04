clear all;
clc;

I = rgb2gray(imread("DIP_2019_A4/q1_4.jpg"));

I = imcomplement(imbinarize(I));

[a,b] = size(I);

s1 = [0,0,0; -1,1,-1; 1,1,1];
s2 = [-1,0,0; 1,1,0; -1,1,-1];

iprev = I;

while (1)
    i1 = doit(s1, iprev);
    i = doit(s2, i1);
    
    s1 = rot90(s1);
    s2 = rot90(s2);
    
    i2 = doit(s1, i);
    i = doit(s2, i2);
    
    s1 = rot90(s1);
    s2 = rot90(s2);
    
    i3 = doit(s1, i);
    i = doit(s2, i3);
    
    s1 = rot90(s1);
    s2 = rot90(s2);
    
    i4 = doit(s1, i);
    i = doit(s2, i4);
    
    s1 = rot90(s1);
    s2 = rot90(s2);
    
    if(sum(sum(iprev ~= i)) == 0)
        break;
    end
    iprev = i;
%     figure;
%     imshow(i);
    
end

function p = doit(m1, dup)
    p = dup;
    [a,b] = size(dup);
    for i=2:a-1
        for j=2:b-1 
            if match(m1, dup(i-1:i+1, j-1:j+1))
                p(i,j) = 0;
            end
        end
    end
end


function b = match(m1, m2)
    a = 0;
    c = 0;
    for i=1:3
        for j=1:3
            if (m1(i,j) ~= -1) && (m1(i,j) == m2(i,j))
                a = a + 1;
            end
            if (m1(i,j) ~= -1)
                c = c + 1;
            end
        end
    end
    if (a == c)
        b = 1;
    else
        b = 0;
    end
end
