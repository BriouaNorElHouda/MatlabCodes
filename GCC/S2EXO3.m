
N=5;
A = randi(N,N)
B = randi(N,N)
c=zeros(N,N);
%C = A + B
sum = 0;

parfor i = 1:N
    for j = N:1
    c(i,j) = A(i,j) + B(i,j)
    end
end
