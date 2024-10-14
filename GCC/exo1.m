% Param�tres de l'algorithme g�n�tique
Npop = 50; % Taille de la population
Nbit = ceil(log2(32)); % Nombre de bits n�cessaires pour coder la plus grande valeur de x
PRcr = 0.8; % Probabilit� de croisement
PRmut = 0.1; % Probabilit� de mutation
MaxGen = 100; % Nombre maximum d'it�rations

% Initialisation de la population
Pop = randi([0 1], Npop, Nbit);
Pop(:, end+1) = zeros(Npop, 1);

% Boucle principale de l'algorithme g�n�tique
for i = 1:MaxGen
    % �valuation de la population
    for j = 1:Npop
       x = bi2de(Pop(j, 1:Nbit)) / (2^Nbit-1) * 31; % Conversion du codage binaire en r�el entre 0 et 31
        Pop(j, end) = 31*x - x^2; % �valuation de la fonction
    end
    
    % S�lection par tournoi
    [~, idx] = sort(Pop(:, end), 'descend');
    SelPop = zeros(Npop, Nbit+1);
    for j = 1:Npop
        p1 = randi([1 Npop/2]); % Premier parent
        p2 = randi([1 Npop/2]); % Deuxi�me parent
        if Pop(idx(p1), end) > Pop(idx(p2), end)
            SelPop(j, :) = Pop(idx(p1), :);
        else
            SelPop(j, :) = Pop(idx(p2), :);
        end
    end
    
    % Croisement
    POPcr = zeros(Npop, Nbit+1);
    for j = 1:2:Npop-1
        if rand() <= PRcr
            p1 = SelPop(j, :);
            p2 = SelPop(j+1, :);
            pt = randi([1 Nbit-1]); % Point de croisement al�atoire
            POPcr(j, :) = [p1(1:pt) p2(pt+1:end)];
            POPcr(j+1, :) = [p2(1:pt) p1(pt+1:end)];
        else
            POPcr(j, :) = SelPop(j, :);
            POPcr(j+1, :) = SelPop(j+1, :);
        end
    end
    
    % Mutation
    POPmut = POPcr;
    for j = 1:Npop
        for k = 1:Nbit
            if rand() <= PRmut
                POPmut(j, k) = 1 - POPmut(j, k); % Inversion de bit
            end
        end
    end
    
    % Remplacement de la population
    Pop = POPmut;
end

% �valuation finale de la population
% �valuation finale de la population
for j = 1:Npop
   x = bi2de(Pop(j, 1:Nbit)) / (2^Nbit-1) * 31; % Conversion du codage binaire en r�el entre 0 et 31

    Pop(j, end) = 31*x - x^2; % �valuation de la fonction
end

% Recherche de la meilleure solution
[best_fitness, best_idx] = max(Pop(:, end));
best_solution = Pop(best_idx, :);
best_x = bi2de(best_solution(1:Nbit)) / (2^Nbit-1) * 31;
best_y = best_fitness;

disp(['La meilleure solution trouv�e est x = ', num2str(best_x), ', fitness = ', num2str(best_y)]);
