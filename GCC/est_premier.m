function nbr = est_premier(n)
nbr = 0;

for i = 2:n/2
   
   premier = true;
   for j = 2:n/2
        if rem(n, j) == 0
           premier = false;
            break;
        end
    end
    
       if premier
        nbr = nbr + 1;
       end
end
end
