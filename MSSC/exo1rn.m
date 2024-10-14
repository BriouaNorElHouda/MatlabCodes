X = [-4, 2; 2, 2; 3, -1; -4, -2; -2, -3; 4, -4];
Y = [1; 1; 1; -1; -1; -1];



% X = [-1,+1;-3,0];
% Y = [ 1; -1];


w = [0.1;0.5] ;
b = 0.1; 
tauapr = 0.1; %prev la div amel precision ajusterlesw

%boucle dap
for j = 1 :4
    for i = 1 : size(X, 1) % pour chaque donn�e d'entra�nement
        % calculer la pr�diction
        y_pred = sign(X(i, :) * w + b);
er=Y(i)- y_pred;
        % mise � jour des poids en cas d'erreur
        if er ~= 0
            w =  w + tauapr * er * X(i, :)';
            b = b + tauapr * er;
            
           
        end
    end
end

% Affichage des r�sultats
disp(['Vecteur de poids w = ', num2str(w')]);
disp(['Biais b = ', num2str(b)]);


% Tracer l'hyperplan s�parateur
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
legend({'Classe +1','Hyperplan s�parateur','Classe -1'}, 'Location', 'best');

% Tester le perceptron sur de nouvelles donn�es
for i = 1 : size(X, 1)
X1 = [-1; -3];
X2 = [+1; 0];
y_pred = sign(X(i, :) * w + b);
disp(['Pr�dictions pour les nouvelles donn�es X1 et X2: ',num2str(y_pred')]);
end

