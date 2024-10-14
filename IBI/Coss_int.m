function enfants = Coss_int(parents, Pc)
    % Appliquer le croisement d'ordre partiel (partially-mapped
    % crossover)pmx
    %here  the order of elements is important,tsp problem we need to order 
    enfants = zeros(size(parents));
    if rand() < Pc
        % Choix des points de croisement
        p = sort(randperm(length(parents), 2));
        
        % Copie des parties non croisées
        enfants(:, p(1):p(2)) = parents(:, p(1):p(2));
        
        % Copie des éléments restants dans l'ordre de l'autre parent
        for i = 1:size(parents, 1)
            for j = 1:size(parents, 2)
                if enfants(i, j) == 0
                    if ~ismember(parents(i, j), enfants(i, :))
                        enfants(i, j) = parents(i, j);
                    else
                        % Trouver l'élément manquant dans l'enfant
                        indice_manquant = find(enfants(i, :) == 0, 1);
                        enfants(i, indice_manquant) = parents(i, j);
                    end
                end
            end
        end
    else
        enfants = parents;
    end
end