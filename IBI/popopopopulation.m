% Paramètres de l'algorithme génétique
Npop = 25;  % Taille de la population
MAXgen = 100; % Nombre maximum de générations
PRcr = 0.7;   % Probabilité de croisement
PRmut = 0.01;   % Probabilité de mutation

% Définition de la fonction objectif
f = @(x) 31*x - x^2;

% Définition de la taille du génome (nombre de bits pour coder un individu)
n = ceil(log2(32));

% Génération de la population initiale
pop = randi([0 1], Npop, n);

% Boucle principale de l'algorithme génétique
for i = 1:MAXgen
    % Évaluation de la population (calcul de la valeur de la fonction objectif)
    fitness = arrayfun(@(j) f(bin2dec(num2str(pop(j,:)))), 1:Npop)';
    
    % Opérateur de sélection par tournoi
    [~, idx] = datasample(fitness, 2, 'Replace', false);
    p1 = pop(idx(1), :);
    p2 = pop(idx(2), :);
    
    % Opérateur de croisement (croisement en un point)
    if rand() < PRcr
        pt = randi([1 n-1]);
        c1 = [p1(1:pt) p2(pt+1:end)];
        c2 = [p2(1:pt) p1(pt+1:end)];
    else
        c1 = p1;
        c2 = p2;
    end
    
    % Opérateur de mutation (mutation par inversion)
    if rand() < PRmut
        pt = randi([1 n]);
        c1(pt) = 1 - c1(pt);
        c2(pt) = 1 - c2(pt);
    end
    
    % Remplacement de la population (remplacement des deux plus mauvais individus)
    [~, idx] = sort(fitness);
    pop(idx(end-1), :) = c1;
    pop(idx(end), :) = c2;
end

% Évaluation finale de la population
fitness = arrayfun(@(j) f(bin2dec(num2str(pop(j,:)))), 1:Npop)';
[~, idx] = max(fitness);

% Affichage de la solution
x = bin2dec(num2str(pop(idx, :)));
fprintf('Maximum trouvé : f(%d) = %f\n', x, f(x));
