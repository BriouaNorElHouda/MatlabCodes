% Paramètres de l'algorithme génétique
nbi = 20;
popsize = 4;
Pc = 0.09;
Pm = 0.02;
A=zeros(1,nbi);


pop = Init_bin(4, 5);
for i = 1:nbi
    % Évaluation de la fitness de chaque individu dans la population
    fitness = zeros(popsize, 1);
    for j = 1:popsize
        fitness(j) = fitness_bin(pop(j, :));
    end
    % Sélection de la nouvelle population
    sel_pop = Select_roulette_bin(pop, fitness);
    
    % Opérateurs génétiques : crossover 
    
     for j = 1:2:popsize
        if rand < Pc
            [enf1, enf2] = Coss_bin(sel_pop(j, :), sel_pop(j + 1, :), Pc);
            sel_pop(j, :) = enf1;
            sel_pop(j + 1, :) = enf2;
        end
     end
    
    % Opérateurs génétiques : mutation
    for j = 1:popsize
        sel_pop(j, :) = Mut_bin(sel_pop(j, :),  Pm );
    end
    
    
    % Remplacement de l'ancienne population par la nouvelle
    pop = sel_pop;
    
    % Affichage de la meilleure solution actuelle
    [best_fitness, best_idx] = max(fitness);
    best_solution = pop(best_idx, :);
    fprintf('Génération %d: x = %d, Fitness = %d\n', i, bin2dec(num2str(best_solution)), best_fitness);
    
    
   
end
    
    figure;
    plot(best_solution(:,:), '-o');
    title('les valeur de x');
    xlabel('Coordonnée X');
    ylabel('Coordonnée Y');
    grid on;
   
% Affichage de la solution finale
[best_fitness, best_idx] = max(fitness);
best_solution = pop(best_idx, :);
fprintf('Solution finale : x = %d, Fitness = %d\n', bin2dec(num2str(best_solution)), best_fitness);


