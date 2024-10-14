clc
clear all
N=10;
Vect=randi([0,50],1,N)
d = distributed(Vect);
n = numel(d);
max= d(1);

for i = 2:n
    if d(i) > max
        max = d(i);
    end
end

fprintf('max est:')
disp(max);

