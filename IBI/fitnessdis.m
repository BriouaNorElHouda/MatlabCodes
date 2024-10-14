function distance = fitnessdis(individu, villes)
    % Calculer la distance totale d'un parcours
    distance = 0;
    for i = 1:length(individu)-1
        distance = distance + norm(villes(individu(i), :) - villes(individu(i+1), :));
    end
end
