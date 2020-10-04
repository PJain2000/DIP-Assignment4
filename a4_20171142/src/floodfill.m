function [I1, flag]= floodfill(i,j,I1,flag,a,b)
    if i<1 || j<1 || i>a || j>b
        return
    end
    if I1(i,j) == 1 && flag(i,j) == 0
        flag(i,j) = 1;
%         I1(i,j) = 0;
        [I1,flag] = floodfill(i,j-1,I1,flag,a,b);
        [I1,flag] = floodfill(i,j+1,I1,flag,a,b);
        [I1,flag] = floodfill(i-1,j,I1,flag,a,b);
        [I1,flag] = floodfill(i+1,j,I1,flag,a,b);
        [I1,flag] = floodfill(i-1,j-1,I1,flag,a,b);
        [I1,flag] = floodfill(i+1,j-1,I1,flag,a,b);
        [I1,flag] = floodfill(i-1,j+1,I1,flag,a,b);
        [I1,flag] = floodfill(i+1,j+1,I1,flag,a,b);
    else
        return
    end 
end