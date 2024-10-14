EXO 2

2 















%1 Le graphe n est pas 2-coloriable car sous graphe complet contre exemple
%2 Le graphe est 3 coloriable ilya une solution 
%3f=fopen('myciel3.txt','r');
N=fscanf(f,'%5d',[1,1]); %nombre de sommets
M=fscanf(f,'%5d',[1,1]); %nombre d'arêtes
MatAdj=zeros(N,N);
r=fscanf(f,'%5d',[2,M]);
for i=1:M
 MatAdj(r(1,i),r(2,i))=1;
end
