% Paramètres de l'algorithme génétique
Npop = 100; % Taille de la population
n = ceil(log2(1024)); % Nombre de bits nécessaires pour coder la plus grande valeur de x
Pc = 0.8; % Probabilité de croisement
Pm = 0.1; % Probabilité de mutation
Maxgen = 100; % Nombre maximum d'itérations

% Initialisation de la population
Pop = randi([0, 1], Npop, n);
Pop = [Pop, zeros(Npop, 1)]; % Ajout d'une colonne pour stocker la fitness

% Boucle principale de l'algorithme génétique
for gen = 1:Maxgen
    % Evaluation de la fitness de chaque individu
    for i = 1:Npop
        x = bi2de(Pop(i, :));
        Pop(i, end) = 31*x - x^2;
    end
    
    % Sélection par tournoi
    Popsel = zeros(Npop, n+1);
    for i = 1:Npop
        idx1 = randi(Npop);
        idx2 = randi(Npop);
        if Pop(idx1, end) > Pop(idx2, end)
            Popsel(i, :) = Pop(idx1, :);
        else
            Popsel(i, :) = Pop(idx2, :);
        end
    end
    
    % Croisement
    Popcr = zeros(Npop, n+1);
    for i = 1:2:Npop
        if rand < Pc
            % Choix des deux parents
            idx1 = randi(Npop);
            idx2 = randi(Npop);
            parent1 = Popsel(idx1, 1:n);
            parent2 = Popsel(idx2, 1:n);
            
            % Point de croisement aléatoire
            pc = randi(n-1);
            
            % Croisement à un point
            enfant1 = [parent1(1:pc), parent2(pc+1:end)];
            enfant2 = [parent2(1:pc), parent1(pc+1:end)];
            
            % Ajout des enfants à la nouvelle population
            Popcr(i, 1:n) = enfant1;
            Popcr(i+1, 1:n) = enfant2;
        else
            % Pas de croisement, on copie les parents
            Popcr(i, 1:n+1) = Popsel(i, :);
            Popcr(i+1, 1:n+1) = Popsel(i+1, :);
        end
    end
    
    % Mutation
    Popmut = zeros(Npop, n+1);
    for i = 1:Npop
        if rand < Pm
            % Mutation d'un bit aléatoire
            idx = randi(n);
            Popmut(i, 1:n) = Popcr(i, 1:n);
            Popmut(i, idx) = 1 - Popmut(i, idx);
        else
            % Pas de mutation, on copie l'individu
            Popmut(i, 1:n+1) = Popcr(i, :);
        end
    end
    
    % Evaluation de la fitness de chaque individu muté
   for i = 1:Npop
    if all(isfinite(Popmut(i,:))) && all(isreal(Popmut(i,:))) && all(Popmut(i,:) >= 0)
        x = bi2de(Popmut(i, :));
        Popmut(i, end) = 31*x - x^2;
    else
        Popmut(i, end) = -Inf;
    end
    % Check for -Inf fitness values
inf_idx = isinf(Pop(:, end));

% If any individuals have -Inf fitness, remove them from the population
if any(inf_idx)
    Pop = Pop(~inf_idx, :);
end
   end

% Remplacement de la population
Pop = Popmut
end

% Recherche du meilleur individu
best_fitness = max(Pop(:, end))
best_individual = Pop(find(Pop(:, end) == best_fitness, 1), :)
best_x = bi2de(best_individual(1:n))


fprintf('Meilleur individu trouvé :')
best_x=best_x
best_fitness=best_fitness
