function pop = Init_int(Popsize, nbre_villes)
    % Initialiser la population avec des permutations aléatoires
    pop = zeros(Popsize, nbre_villes);
    for i = 1:Popsize
        pop(i, :) = randperm(nbre_villes);% used to generate a random permutation of integers 1_20
    end
end