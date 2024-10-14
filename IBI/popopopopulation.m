% Param�tres de l'algorithme g�n�tique
Npop = 25;  % Taille de la population
MAXgen = 100; % Nombre maximum de g�n�rations
PRcr = 0.7;   % Probabilit� de croisement
PRmut = 0.01;   % Probabilit� de mutation

% D�finition de la fonction objectif
f = @(x) 31*x - x^2;

% D�finition de la taille du g�nome (nombre de bits pour coder un individu)
n = ceil(log2(32));

% G�n�ration de la population initiale
pop = randi([0 1], Npop, n);

% Boucle principale de l'algorithme g�n�tique
for i = 1:MAXgen
    % �valuation de la population (calcul de la valeur de la fonction objectif)
    fitness = arrayfun(@(j) f(bin2dec(num2str(pop(j,:)))), 1:Npop)';
    
    % Op�rateur de s�lection par tournoi
    [~, idx] = datasample(fitness, 2, 'Replace', false);
    p1 = pop(idx(1), :);
    p2 = pop(idx(2), :);
    
    % Op�rateur de croisement (croisement en un point)
    if rand() < PRcr
        pt = randi([1 n-1]);
        c1 = [p1(1:pt) p2(pt+1:end)];
        c2 = [p2(1:pt) p1(pt+1:end)];
    else
        c1 = p1;
        c2 = p2;
    end
    
    % Op�rateur de mutation (mutation par inversion)
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

% �valuation finale de la population
fitness = arrayfun(@(j) f(bin2dec(num2str(pop(j,:)))), 1:Npop)';
[~, idx] = max(fitness);

% Affichage de la solution
x = bin2dec(num2str(pop(idx, :)));
fprintf('Maximum trouv� : f(%d) = %f\n', x, f(x));
