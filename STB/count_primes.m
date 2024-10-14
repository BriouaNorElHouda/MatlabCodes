function nbr = count_primes(N)
nbr = 0;

for i = 2:N/2
   
   prime = true;
   for j = 2:N/2
        if rem(N, j) == 0
           prime = false;
            break;
        end
    end
    
       if prime
        nbr = nbr + 1;
       end
end
end
