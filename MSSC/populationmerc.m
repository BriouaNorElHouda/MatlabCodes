% Donn�es du probl�me
poids = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];
valeurs = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];
capacite_maximum = 3000;

% Param�tres de l'algorithme g�n�tique
Npop = 50;
MAXgen = 100;
PRmut = 0.01;
PRcr = 0.6;
taille_tournoi = 2;

% 2. Initialiser al�atoirement la population Pop
Pop = randi([0,1], Npop, length(poids));

% 3. Evaluer chaque individu de la population en calculant la fonction fitness
for generation = 1:MAXgen
    % Evaluation de la population
    fitness = zeros(Npop, 1);
    for i = 1:Npop
        poids_total = sum(Pop(i,:) .* poids);
        if poids_total <= capacite_maximum
            fitness(i) = sum(Pop(i,:) .* valeurs);
        end
    end

    % 4. Appliquer � la population l�op�rateur de s�lection par tournoi
    parents = zeros(Npop, length(poids));
    for i = 1:Npop
        indices_tournoi = randperm(Npop, taille_tournoi);
        [~, index_max] = max(fitness(indices_tournoi));
        parents(i,:) = Pop(indices_tournoi(index_max),:);
    end

    % G�n�rer une nouvelle population en appliquer � la population l�op�rateur de Croisement.

    enfants = zeros(Npop, length(poids));
    for i = 1:2:Npop
        if rand < PRcr
            POPcr = randi(length(poids)-1);
            enfants(i,:) = [parents(i,1:POPcr) parents(i+1,POPcr+1:end)];
            enfants(i+1,:) = [parents(i+1,1:POPcr) parents(i,POPcr+1:end)];
        else
            enfants(i,:) = parents(i,:);
            enfants(i+1,:) = parents(i+1,:);
        end
    end

    % Mutation
    for i = 1:Npop
        for j = 1:length(poids)
            if rand < PRmut
                enfants(i,j) = 1 - enfants(i,j);
            end
        end
    end

% POPmut = zeros(Npop, length(poids)+1);
%     for i = 1:Npop
%         if rand < PRmut
%             % Mutation d'un bit al�atoire
%             idx = randi(length(poids));
%             POPmut(i, 1:length(poids)) = Popcr(i, 1:length(poids));
%             POPmut(i, idx) = 1 - POPmut(i, idx);
%         else
%             % Pas de mutation, on copie l'individu
%             POPmut(i, 1:length(poids)+1) = POPcr(i, :);
%         end
%     end
     % Remplacement de la population par les enfants
    Pop = enfants;
end

% Evaluation finale de la population
fitness = zeros(Npop, 1);
for i = 1:Npop
    poids_total = sum(Pop(i,:) .* poids);
    if poids_total <= capacite_maximum
        fitness(i) = sum(Pop(i,:) .* valeurs);
    end
end

% Trouver la meilleure solution
[meilleure_fitness, index_meilleur] = max(fitness);
meilleure_solution = Pop(index_meilleur,:);

% Affichage des r�sultats
fprintf('Meilleure solution trouv�e : \n');
fprintf('Poids total : %d\n', sum(meilleure_solution .* poids));
fprintf('Valeur totale : %d\n', sum(meilleure_solution .* valeurs));
fprintf('El�ments s�lectionn�s : ');
for i = 1:length(poids)
    if meilleure_solution(i) == 1
        fprintf('%d ', i);
    end
end
fprintf('\n');