% Paramètres du PSO
nbr_it = 100;
Nbpop = 50;
omega = 1; % coef dinertie
C1 = 2; % coef d'attraction
C2 = 2;

% Définition des bornes pour chaque ingrédient
F = [100, 250];
S = [30, 125];
B = [50, 125];
L = [12, 40];

% Initialisation des particules
[x, v, mp] = init(Nbpop, F, S, B, L);

% Initialize an array to store the best fitness values at each iteration
best_fitness_values = zeros(1, nbr_it);

% Boucle principale du PSO
for i = 1:nbr_it
    % Mise à jour des vitesses et positions
    [x, v, mp, mpg] = miseajour(x, v, mp, F, S, B, L, omega, C1, C2);

    % Store the best fitness value at each iteration
    best_fitness_values(i) = fitnes(mpg);

   
    
end

% Affichage des valeurs optimales des ingrédients
fprintf('\nValeurs optimales des ingrédients :\n');
fprintf('Farine (F): %.2f g\n', mpg(1));
fprintf('Sucre (S): %.2f g\n', mpg(2));
fprintf('Beurre (B): %.2f g\n', mpg(3));
fprintf('Levure chimique (L): %.2f g\n', mpg(4));

fprintf(' best goût(fitness) = %.4f\n', min(best_fitness_values(i)));
% Plot the best fitness values over iterations
figure;
plot(1:nbr_it, best_fitness_values, 'x-', 'LineWidth', 2);
title('Evolution of Best Fitness Value');
xlabel('Iteration');
ylabel('Best Fitness Value');
grid on;
