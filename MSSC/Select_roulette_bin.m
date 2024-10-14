function sel_pop = Select_roulette_bin(pop, fitness)
    
    ftotal = sum(fitness);
    nindiv = size(pop, 1);
    sel_pop = zeros(size(pop));
    
    for i = 1:nindiv
        p(i) = fitness(i) / ftotal;  
        vect(1,i) = p(i);
        
        sel_pop(i, :) = rand(1, size(pop, 2)) < vect(i);
        
    end
end
