N=10;
Vect=randi([0,50],1,N)
max=Vect(1);
for i=2:N
    if Vect(i)>max
       %La variable temporaire max dans un parfor est effacé au début de chaque itération
        max=Vect(i);
    end
end
fprintf('max est:')
disp(max);

