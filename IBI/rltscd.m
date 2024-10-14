% Parameters
Npop = 100;  % Population size
Ngen = 100;  % Number of generations
Pc = 0.8;    % Crossover probability
Pm = 0.01;   % Mutation probability
W = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];  % Weights
V = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];  % Values
Wmax = 3000;  % Maximum capacity

% Step 1: Create population
npop = zeros(Npop, length(W) + 1);
npop(:, 1:length(W)) = randi([0 1], Npop, length(W));  % Random binary encoding
npop(:, end) = eval_fitness(npop, W, V, Wmax);

% Step 2-9: Repeat for Ngen generations
for gen = 1:Ngen
    % Step 4: Selection by tournament
    parents = selection_tournament(npop);

    % Step 5: Crossover
    offspring = crossover(parents, Pc);

    % Step 6: Mutation
    offspring = mutation(offspring, Pm);

    % Step 7: Evaluate fitness
    offspring(:, end) = eval_fitness(offspring, W, V, Wmax);

    % Step 8: Replace population
    npop = replacement(npop, offspring);

    % Display best solution so far
    [~, idx] = max(npop(:, end));
    fprintf('Generation %d: Best fitness = %d\n', gen, npop(idx, end));
end

% Find best solution in final population
[best_fitness, idx] = max(npop(:, end));
best_solution = npop(idx, 1:end-1);
fprintf('Best solution found: %s, Fitness = %d\n', num2str(best_solution), best_fitness);

% Fitness evaluation function
function fitness = eval_fitness(population, weights, values, max_weight)
    fitness = sum(values .* population, 2);  % Compute fitness as sum of values
    overweight = sum(weights .* population, 2) - max_weight;  % Compute overweight penalty
    overweight(overweight < 0) = 0;  % Clip negative values to 0
    fitness = fitness - overweight;  % Subtract overweight penalty from fitness
end

% Selection by tournament function
function parents = selection_tournament(population)
    K = 2;  % Tournament size
    N = size(population, 1);  % Population size
    parents = zeros(N, size(population, 2));  % Preallocate space for offspring

    for i = 1:N
        % Select two random individuals for the tournament
        idx = randperm(N, K);
        tournament = population(idx, :);

        % Select the best individual from the tournament
        [~, best_idx] = max(tourna% Parameters
Npop = 100;  % Population size
Ngen = 100;  % Number of generations
Pc = 0.8;    % Crossover probability
Pm = 0.01;   % Mutation probability
W = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];  % Weights
V = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];  % Values
Wmax = 3000;  % Maximum capacity

% Step 1: Create population
npop = zeros(Npop, length(W) + 1);
npop(:, 1:length(W)) = randi([0 1], Npop, length(W));  % Random binary encoding
npop(:, end) = eval_fitness(npop, W, V, Wmax);

% Step 2-9: Repeat for Ngen generations
for gen = 1:Ngen
    % Step 4: Selection by tournament
    parents = selection_tournament(npop);

    % Step 5: Crossover
    offspring = crossover(parents, Pc);

    % Step 6: Mutation
    offspring = mutation(offspring, Pm);

    % Step 7: Evaluate fitness
    offspring(:, end) = eval_fitness(offspring, W, V, Wmax);

    % Step 8: Replace population
    npop = replacement(npop, offspring);

    % Display best solution so far
    [~, idx] = max(npop(:, end));
    fprintf('Generation %d: Best fitness = %d\n', gen, npop(idx, end));
end

% Find best solution in final population
[best_fitness, idx] = max(npop(:, end));
best_solution = npop(idx, 1:end-1);
fprintf('Best solution found: %s, Fitness = %d\n', num2str(best_solution), best_fitness);

% Fitness evaluation function
function fitness = eval_fitness(population, weights, values, max_weight)
    fitness = sum(values .* population, 2);  % Compute fitness as sum of values
    overweight = sum(weights .* population, 2) - max_weight;  % Compute overweight penalty
    overweight(overweight < 0) = 0;  % Clip negative values to 0
    fitness = fitness - overweight;  % Subtract overweight penalty from fitness
end

% Selection by tournament function
function parents = selection_tournament(population)
    K = 2;  % Tournament size
    N = size(population, 1);  % Population size
    parents = zeros(N, size(population, 2));  % Preallocate space for offspring

    for i = 1:N
        % Select two random individuals for the tournament
        idx = randperm(N, K);
        tournament = population(idx, :);

        % Select the best individual from the tournament
        [~, best_idx] = max(tournament(:, end));
        parents(i, :) = tournament(best_idx, :);
    end
end

% Crossover function
function offspring = crossover(parents, pc)
    N = size(parents, 1);  % Number of parents
    L = size(parents, 2);  % Length of bit string
    offspring = zeros(N, L);  % Preallocate
ment(:, end));
        parents(i, :) = tournament(best_idx, :);
    end% Parameters
Npop = 100;  % Population size
Ngen = 100;  % Number of generations
Pc = 0.8;    % Crossover probability
Pm = 0.01;   % Mutation probability
W = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];  % Weights
V = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];  % Values
Wmax = 3000;  % Maximum capacity

% Step 1: Create population
npop = zeros(Npop, length(W) + 1);
npop(:, 1:length(W)) = randi([0 1], Npop, length(W));  % Random binary encoding
npop(:, end) = eval_fitness(npop, W, V, Wmax);

% Step 2-9: Repeat for Ngen generations
for gen = 1:Ngen
    % Step 4: Selection by tournament
    parents = selection_tournament(npop);

    % Step 5: Crossover
    offspring = crossover(parents, Pc);

    % Step 6: Mutation
    offspring = mutation(offspring, Pm);

    % Step 7: Evaluate fitness
    offspring(:, end) = eval_fitness(offspring, W, V, Wmax);

    % Step 8: Replace population
    npop = replacement(npop, offspring);

    % Display best solution so far
    [~, idx] = max(npop(:, end));
    fprintf('Generation %d: Best fitness = %d\n', gen, npop(idx, end));
end

% Find best solution in final population
[best_fitness, idx] = max(npop(:, end));
best_solution = npop(idx, 1:end-1);
fprintf('Best solution found: %s, Fitness = %d\n', num2str(best_solution), best_fitness);

% Fitness evaluation function
function fitness = eval_fitness(population, weights, values, max_weight)
    fitness = sum(values .* population, 2);  % Compute fitness as sum of values
    overweight = sum(weights .* population, 2) - max_weight;  % Compute overweight penalty
    overweight(overweight < 0) = 0;  % Clip negative values to 0
    fitness = fitness - overweight;  % Subtract overweight penalty from fitness
end

% Selection by tournament function
function parents = selection_tournament(population)
    K = 2;  % Tournament size
    N = size(population, 1);  % Population size
    parents = zeros(N, size(population, 2));  % Preallocate space for offspring

    for i = 1:N
        % Select two random individuals for the tournament
        idx = randperm(N, K);
        tournament = population(idx, :);

        % Select the best individual from the tournament
        [~, best_idx] = max(tournament(:, end));
        parents(i, :) = tournament(best_idx, :);
    end
end

% Crossover function
function offspring = crossover(parents, pc)
    N = size(parents, 1);  % Number of parents
    L = size(parents, 2);  % Length of bit string
    offspring = zeros(N, L);  % Preallocate
% Parameters
Npop = 100;  % Population size
Ngen = 100;  % Number of generations
Pc = 0.8;    % Crossover probability
Pm = 0.01;   % Mutation probability
W = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];  % Weights
V = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];  % Values
Wmax = 3000;  % Maximum capacity

% Step 1: Create population
npop = zeros(Npop, length(W) + 1);
npop(:, 1:length(W)) = randi([0 1], Npop, length(W));  % Random binary encoding
npop(:, end) = eval_fitness(npop, W, V, Wmax);

% Step 2-9: Repeat for Ngen generations
for gen = 1:Ngen
    % Step 4: Selection by tournament
    parents = selection_tournament(npop);

    % Step 5: Crossover
    offspring = crossover(parents, Pc);

    % Step 6: Mutation
    offspring = mutation(offspring, Pm);

    % Step 7: Evaluate fitness
    offspring(:, end) = eval_fitness(offspring, W, V, Wmax);

    % Step 8: Replace population
    npop = replacement(npop, offspring);

    % Display best solution so far
    [~, idx] = max(npop(:, end));
    fprintf('Generation %d: Best fitness = %d\n', gen, npop(idx, end));
end

% Find best solution in final population
[best_fitness, idx] = max(npop(:, end));
best_solution = npop(idx, 1:end-1);
fprintf('Best solution found: %s, Fitness = %d\n', num2str(best_solution), best_fitness);

% Fitness evaluation function
function fitness = eval_fitness(population, weights, values, max_weight)
    fitness = sum(values .* population, 2);  % Compute fitness as sum of values
    overweight = sum(weights .* population, 2) - max_weight;  % Compute overweight penalty
    overweight(overweight < 0) = 0;  % Clip negative values to 0
    fitness = fitness - overweight;  % Subtract overweight penalty from fitness
end

% Selection by tournament function
function parents = selection_tournament(population)
    K = 2;  % Tournament size
    N = size(population, 1);  % Population size
    parents = zeros(N, size(population, 2));  % Preallocate space for offspring

    for i = 1:N
        % Select two random individuals for the tournament
        idx = randperm(N, K);
        tournament = population(idx, :);

        % Select the best individual from the tournament
        [~, best_idx] = max(tournament(:, end));
        parents(i, :) = tournament(best_idx, :);
    end
end

% Crossover function
function offspring = crossover(parents, pc)
    N = size(parents, 1);  % Number of parents
    L = size(parents, 2);  % Length of bit string
    offspring = zeros(N, L);  % Preallocate
% Parameters
Npop = 100;  % Population size
Ngen = 100;  % Number of generations
Pc = 0.8;    % Crossover probability
Pm = 0.01;   % Mutation probability
W = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];  % Weights
V = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];  % Values
Wmax = 3000;  % Maximum capacity

% Step 1: Create population
npop = zeros(Npop, length(W) + 1);
npop(:, 1:length(W)) = randi([0 1], Npop, length(W));  % Random binary encoding
npop(:, end) = eval_fitness(npop, W, V, Wmax);

% Step 2-9: Repeat for Ngen generations
for gen = 1:Ngen
    % Step 4: Selection by tournament
    parents = selection_tournament(npop);

    % Step 5: Crossover
    offspring = crossover(parents, Pc);

    % Step 6: Mutation
    offspring = mutation(offspring, Pm);

    % Step 7: Evaluate fitness
    offspring(:, end) = eval_fitness(offspring, W, V, Wmax);

    % Step 8: Replace population
    npop = replacement(npop, offspring);

    % Display best solution so far
    [~, idx] = max(npop(:, end));
    fprintf('Generation %d: Best fitness = %d\n', gen, npop(idx, end));
end

% Find best solution in final population
[best_fitness, idx] = max(npop(:, end));
best_solution = npop(idx, 1:end-1);
fprintf('Best solution found: %s, Fitness = %d\n', num2str(best_solution), best_fitness);

% Fitness evaluation function
function fitness = eval_fitness(population, weights, values, max_weight)
    fitness = sum(values .* population, 2);  % Compute fitness as sum of values
    overweight = sum(weights .* population, 2) - max_weight;  % Compute overweight penalty
    overweight(overweight < 0) = 0;  % Clip negative values to 0
    fitness = fitness - overweight;  % Subtract overweight penalty from fitness
end

% Selection by tournament function
function parents = selection_tournament(population)
    K = 2;  % Tournament size
    N = size(population, 1);  % Population size
    parents = zeros(N, size(population, 2));  % Preallocate space for offspring

    for i = 1:N
        % Select two random individuals for the tournament
        idx = randperm(N, K);
        tournament = population(idx, :);

        % Select the best individual from the tournament
        [~, best_idx] = max(tournament(:, end));
        parents(i, :) = tournament(best_idx, :);
    end
end

% Crossover function
function offspring = crossover(parents, pc)
    N = size(parents, 1);  % Number of parents
    L = size(parents, 2);  % Length of bit string
    offspring = zeros(N, L);  % Preallocate

% Parameters
Npop = 100;  % Population size
Ngen = 100;  % Number of generations
Pc = 0.8;    % Crossover probability
Pm = 0.01;   % Mutation probability
W = [323, 982, 158, 420, 879, 765, 629, 786, 30, 268, 910, 289];  % Weights
V = [20, 31, 17, 67, 92, 70, 82, 41, 94, 2, 34, 12];  % Values
Wmax = 3000;  % Maximum capacity

% Step 1: Create population
npop = zeros(Npop, length(W) + 1);
npop(:, 1:length(W)) = randi([0 1], Npop, length(W));  % Random binary encoding
npop(:, end) = eval_fitness(npop, W, V, Wmax);

% Step 2-9: Repeat for Ngen generations
for gen = 1:Ngen
    % Step 4: Selection by tournament
    parents = selection_tournament(npop);

    % Step 5: Crossover
    offspring = crossover(parents, Pc);

    % Step 6: Mutation
    offspring = mutation(offspring, Pm);

    % Step 7: Evaluate fitness
    offspring(:, end) = eval_fitness(offspring, W, V, Wmax);

    % Step 8: Replace population
    npop = replacement(npop, offspring);

    % Display best solution so far
    [~, idx] = max(npop(:, end));
    fprintf('Generation %d: Best fitness = %d\n', gen, npop(idx, end));
end

% Find best solution in final population
[best_fitness, idx] = max(npop(:, end));
best_solution = npop(idx, 1:end-1);
fprintf('Best solution found: %s, Fitness = %d\n', num2str(best_solution), best_fitness);

% Fitness evaluation function
function fitness = eval_fitness(population, weights, values, max_weight)
    fitness = sum(values .* population, 2);  % Compute fitness as sum of values
    overweight = sum(weights .* population, 2) - max_weight;  % Compute overweight penalty
    overweight(overweight < 0) = 0;  % Clip negative values to 0
    fitness = fitness - overweight;  % Subtract overweight penalty from fitness
end

% Selection by tournament function
function parents = selection_tournament(population)
    K = 2;  % Tournament size
    N = size(population, 1);  % Population size
    parents = zeros(N, size(population, 2));  % Preallocate space for offspring

    for i = 1:N
        % Select two random individuals for the tournament
        idx = randperm(N, K);
        tournament = population(idx, :);

        % Select the best individual from the tournament
        [~, best_idx] = max(tournament(:, end));
        parents(i, :) = tournament(best_idx, :);
    end
end

% Crossover function
function offspring = crossover(parents, pc)
    N = size(parents, 1);  % Number of parents
    L = size(parents, 2);  % Length of bit string
    offspring = zeros(N, L);  % Preallocate


% Crossover function
function offspring = crossover(parents, pc)
    N = size(parents, 1);  % Number of parents
    L = size(parents, 2);  % Length of bit string
    offspring = zeros(N, L);  % Preallocate
