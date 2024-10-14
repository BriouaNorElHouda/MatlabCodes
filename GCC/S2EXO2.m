
% start local 4
%A = magic(5)
N=5;
M = randi(N,N)
%s =sum(diag(A))

sum = 0;

parfor i = 1:5
  sum = sum + M(i,i)
end

S = S
%parfor i = 1:N
    %for j = N:1
% sum2 = sum2 + M(i,j);
    %end 
%end
%parfor i = 1:5
 %sum2 = sum2 + M(i,N)
 %N = N-1;
%end