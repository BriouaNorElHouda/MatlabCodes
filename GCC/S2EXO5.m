N=5;
A = rand(1,N)

for i = 1:length(A)-1
    for j = i+1:length(A)
        if A(i) < A(j)
            temp = A(i);
            A(i) = A(j);
            A(j) = temp;
        end
    end
end


triA = A