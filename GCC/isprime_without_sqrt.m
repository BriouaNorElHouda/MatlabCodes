function count = primes(N)


count = 0;


for i = 2:N-1
   
    is_prime = true;
    for j = 2:sqrt(i)
        if rem(i, j) == 0
            is_prime = false;
            break;
        end
    end
    
    if is_prime
        count = count + 1;
    end
end
end
