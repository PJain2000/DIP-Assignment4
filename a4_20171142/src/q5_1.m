clear all;
clc;

I = imread("DIP_2019_A4/q5_1.png");

c1 = [255, 0, 0];
c2 = [31, 73, 125];
c3 = [0, 176, 80];
c4 = [0, 0, 0];
c5 = [112, 48, 160];

count1 = noc(I, c1);
count2 = noc(I, c2);
count3 = noc(I, c3);
count4 = noc(I, c4);
count5 = noc(I, c5);

function [count] = noc(I, color)
    [a, b, c] = size(I);
    I1 = zeros([a,b]);
    
    for i=1:a
        for j=1:b
            if (I(i,j,1) == color(1)) && (I(i,j,2) == color(2)) && (I(i,j,3) == color(3))
                I1(i,j) = 1;
            else
                I1(i,j) = 0;
            end
        end
    end
    
    flag = zeros(size(I1));

    count = 0;
    
    for i=1:a
        for j=1:b
            if I1(i,j) == 1 && flag(i,j) == 0
                count = count+1;
                [I1,flag] = floodfill(i,j,I1,flag,a,b);
            end
        end
    end
    
end