function [N , M]  = read()
f=fopen('myciel3.txt', 'r');
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
set(h.Nodes,'LineColor',[0 0 0]);
set(h.Edges,'LineColor',[0 0 0]);
set(h.nodes, 'shape','circle');
end
