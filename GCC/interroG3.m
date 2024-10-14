clear all;
clc;
%matlabpool close;
%matlabpool open local 4;
 
N = 6;
M = 6;
 
mat = randi([1, 8], N, M);
 
mat_dist = distributed(mat);
 
disp(mat);
c = 0;
 
spmd
    a = getLocalPart(mat_dist);
    [N, M] = size(a);
    for i = 1:N
        for j = 1:M
            if a(i, j) == 1
                c = c + 1;
            end
        end
    end
    
    if labindex ~= 4
        labSend(c, 4);
    else
        aya = labReceive(1);
        aya1 = labReceive(2);
        aya2 = labReceive(3);
        nour = aya1 + aya2 + aya+c;
        disp(['The number of occurrences of 1 in the matrix is: ' num2str(nour)]);
    end
end
 
disp(mat);