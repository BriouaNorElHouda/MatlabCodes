function tsp()

    % Nombre de villes
    nombre_villes = 8;
    
    % Générer les coordonnées des villes de manière aléatoire
    villes = randi([1, 100], nombre_villes, 2);
    
    % Paramètres de l'algorithme génétique
    nombre_individus = 20;
    nombre_generations = 50;
    taux_croisement = 0.8;
    taux_mutation = 0.02;

    % Initialiser la population
    population = init_population(nombre_individus, nombre_villes);

    % Boucle d'optimisation génétique
    for generation = 1:nombre_generations
        
        % Évaluer la population
        scores = evaluer_population(population, villes);
        
        % Sélectionner les parents par roulette
        parents = selection_roulette(population, scores);
        
        % Appliquer le croisement d'ordre partiel (partially-mapped crossover)
        enfants = crossover(parents, taux_croisement);
        
        % Appliquer la mutation par inversion
        enfants = mutation(enfants, taux_mutation);
        
        % Remplacer la population par les enfants
        population = enfants;
        
        % Afficher la meilleure distance actuelle
        meilleur_score = min(scores);
        fprintf('Generation %d: Meilleure distance = %.2f\n', generation, meilleur_score);
    end

    % Afficher le parcours optimal
    meilleur_individu = population(1, :);
    meilleur_parcours = villes(meilleur_individu, :);
    
    % Ajouter la première ville à la fin pour former un cycle
    meilleur_parcours = [meilleur_parcours; meilleur_parcours(1, :)];
    
    % Afficher le résultat
    fprintf('Parcours optimal:\n');
    disp(meilleur_parcours);
    
    % Dessiner le parcours optimal
    figure;
    plot(meilleur_parcours(:, 1), meilleur_parcours(:, 2), '-o');
    title('Parcours Optimal');
    xlabel('Coordonnée X');
    ylabel('Coordonnée Y');
    grid on;
end

function population = init_population(nombre_individus, nombre_villes)
    % Initialiser la population avec des permutations aléatoires
    population = zeros(nombre_individus, nombre_villes);
    for i = 1:nombre_individus
        population(i, :) = randperm(nombre_villes);
    end
end

function scores = evaluer_population(population, villes)
    % Évaluer la distance totale de chaque individu dans la population
    nombre_individus = size(population, 1);
    scores = zeros(1, nombre_individus);
    for i = 1:nombre_individus
        scores(i) = distance_totale(population(i, :), villes);
    end
end

function distance = distance_totale(individu, villes)
    % Calculer la distance totale d'un parcours
    distance = 0;
    for i = 1:length(individu)-1
        distance = distance + norm(villes(individu(i), :) - villes(individu(i+1), :));
    end
end

function parents = selection_roulette(population, scores)
    % Sélectionner les parents par roulette
    probabilites = 1 ./ scores;
    probabilites = probabilites / sum(probabilites);
    indices_parents = randsample(1:length(scores), 2, true, probabilites);
    parents = population(indices_parents, :);
end

function enfants = crossover(parents, taux_croisement)
    % Appliquer le croisement d'ordre partiel (partially-mapped crossover)
    enfants = zeros(size(parents));
    if rand() < taux_croisement
        % Choix des points de croisement
        points_croisement = sort(randperm(length(parents), 2));
        
        % Copie des parties non croisées
        enfants(:, points_croisement(1):points_croisement(2)) = parents(:, points_croisement(1):points_croisement(2));
        
        % Copie des éléments restants dans l'ordre de l'autre parent
        for i = 1:size(parents, 1)
            enfants(i, :) = remplir_crossover(parents(i, :), enfants(i, :));
        end
    else
        enfants = parents;
    end
end

function enfant = remplir_crossover(parent, enfant)
    % Remplir les éléments manquants dans l'enfant en suivant l'ordre du parent
    for i = 1:length(enfant)
        if enfant(i) == 0
            if ~ismember(parent(i), enfant)
                enfant(i) = parent(i);
            else
                % Trouver l'élément manquant dans l'enfant
                indice_manquant = find(enfant == 0, 1);
                enfant(indice_manquant) = parent(i);
            end
        end
    end
end

function enfants = mutation(enfants, taux_mutation)
    % Appliquer la mutation par inversion
    for i = 1:size(enfants, 1)
        if rand() < taux_mutation
            % Choix des points d'inversion
            points_inversion = sort(randperm(length(enfants(i, :)), 2));
            
            % Inversion des éléments entre les points d'inversion
            enfants(i, points_inversion(1):points_inversion(2)) = fliplr(enfants(i, points_inversion(1):points_inversion(2)));
        end
    end
end

