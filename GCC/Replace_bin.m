function new_pop = Replace_bin(v, pop)
    [~, worst_idx] = min(fitness_bin(pop)); 
    new_pop = pop;
    new_pop(worst_idx, :) = v;
end
