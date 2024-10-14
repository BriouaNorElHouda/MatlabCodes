N=3;
M=4;
c=0;
s=0;
A=randi(10,N,M)
ad1=distributed(A)
n = numel(ad1);

spmd
 a=getLocalPart(ad1);
end
for i =1:M
  c=c+a{i}
end
for i = 1:N
   s=s+c(i)
end
spmd
    if labindex==2
        avg=s/n
    end
end
