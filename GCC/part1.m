N=5;
A=rand(1,N)
s= 0;
counter= 0;

parfor i=1:N
    somme=somme+Vect(i);
    counter=counter+1;
end
    moyenne= somme/counter;
    disp(moyenne);

