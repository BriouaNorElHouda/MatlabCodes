function [N , M]  = lire()
f=fopen('arret.txt', 'r');
N=fscanf(f,'%5d',[1 1])
M=fscanf(f,'%5d',[1 1])
MatAdj=zeros(N,N)
R=fscanf(f,'%5d',[2,M])

for i = 1:M
    MatAdj(R(1,i),R(2,i))=1;
end
bg=biograph(MatAdj);
set(bg, 'ShowArrows', 'Off');
h=view(bg);
set(h.Nodes,'shape','circle');
X=[1 2 3 4 5 6];
for i=1:N
  if  X(i)==1
set(h.Nodes(i),'color',[0 1 0]);
  end
   if  X(i)==2
set(h.Nodes(i),'color',[1 0 0]);
   end
   if  X(i)==3
set(h.Nodes(i),'color',[1 0 1]);
   end
end
if verifier(MatAdj,X,N)==1
   disp('legraph est 4 coloriable');
else
    
disp('legraph est non 4 coloriable');
end



