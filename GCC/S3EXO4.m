N=5;
A = randi(N,N)
B = randi(N,N)

%C = A * B
sum = 0;

for i = 1:N
    for j = N:1
    sum = A(i,j) * B(i,j)
    end
end
%a(n,m)*b(m,p)=c(n,p)