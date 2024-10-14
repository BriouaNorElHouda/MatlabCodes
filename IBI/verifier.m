function B = verifier(MatAdj,X,N)
B=1;
for i=1:N
 for j=1:N
 if MatAdj(i,j)==1
 if X(i)==X(j)
 B=0;
 end
 end
 end
end