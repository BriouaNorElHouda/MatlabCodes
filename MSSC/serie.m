function a = serie( M,N )
 a=zeros(N,1);
 for i=1:N
 a(i)=max(eig(rand(M)));
 end
end
