X = [-4, 2; 2, 2; 3, -1; -4, -2; -2, -3; 4, -4];
Y = [1; 1; 1; -1; -1; -1];


w = [0.1;0.5] ;
b = 1; 
tauapr = 0.1; 

%boucle dap
for i = 1 : 100 
    for j = 1 : size(X, 1) % pour chaque donnée d'entraînement
        % calculer la prédiction
        y_pred = sign(X(j, :) * w + b);
er=Y(j)- y_pred;
        % mise à jour des poids et du biais en cas d'erreur
        if y_pred ~= Y(j)
            w =  tauapr * er * X(j, :)';
            b = b + tauapr * er;
        end
    end
end

% Affichage des résultats
disp(['Vecteur de poids w = ', num2str(w')]);
disp(['Biais b = ', num2str(b)]);

% Tracer l'hyperplan séparateur
x_hyperplan = linspace(min(X(:, 1)), max(X(:, 1)), 2);
y_hyperplan = (-b - w(1) * x_hyperplan) / w(2);
scatter(X(:, 1), X(:, 2), 50, Y, 'filled');
hold on;
plot(x_hyperplan, y_hyperplan, 'k-', 'LineWidth', 2);
axis equal;
xlim([min(X(:, 1)), max(X(:, 1))]);
ylim([min(X(:, 2)), max(X(:, 2))]);
xlabel('X1');
ylabel('X2');
title('Classification binaire avec le perceptron');
legend({'Classe +1', 'Classe -1', 'Hyperplan séparateur'}, 'Location', 'best');

% Tester le perceptron sur de nouvelles données
x1 = [-1; -3];
x2 = [+1; 0];
y_pred = sign(X(j, :) * w + b);
disp(['Prédictions pour les nouvelles données : ', num2str(y_pred')]);
