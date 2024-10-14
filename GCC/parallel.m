
function a = parallel( M,N )
 a=zeros(N,1);
 parfor i=1:N
 a(i)=max(eig(rand(M)));
 end
end









