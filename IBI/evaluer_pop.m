
function scores = evaluer_pop(pop, villes)
    % Évaluer la distance totale de chaque individu dans la population
    Popsize = size(pop, 1);
    scores = zeros(1, Popsize);
    for i = 1:Popsize
        scores(i) = distance_totale(pop(i, :), villes);
    end
end












function distance = distance_totale(individu, villes)
    % Calculer la distance totale d'un parcours
    distance = 0;
    for i = 1:length(individu)-1
        distance = distance + norm(villes(individu(i), :) - villes(individu(i+1), :));
    end
end
