

% Importer les données
load fisheriris

X = meas(1:100, :);  % Prendre les 100 premières lignes pour l'apprentissage
Y = [ones(50,1); 2*ones(50,1)];  % 1 pour la première espèce, 2 pour la deuxième espèce


% Diviser les données en ensembles d'apprentissage et de test

X_train = [X(1:25, :); X(51:75, :)];
Y_train = [Y(1:25, :); Y(51:75, :)];


X_test = [X(26:50, :); X(76:100, :)];
Y_test = [Y(26:50, :); Y(76:100, :)];



w = [0.1;0.5] ;
b = 1; 
tauapr = 0.1; 

%boucle dap
for i = 1 : 100 
    for j = 1 : size(X_train, 1) % pour chaque donnée d'entraînement
        % calculer la prédiction
      %  Fonction Combinaison
        %Fonction  Transfert en échelon
        y_pred = sign(X_train(j, :) * w + b);
er=Y(j)- y_pred;
        % mise à jour des poids et du biais en cas d'erreur
        if y_pred ~= Y_train(j)
            w =  tauapr * er * X_train(j, :)';
            b = b + tauapr * er;
        end
    end
end



net = trainNetwork(X_train', categorical(Y_train), layers, options);

Y_pred = classify(net, X_test');
accuracy = sum(Y_pred == categorical(Y_test)) / numel(Y_test);
fprintf('Précision du réseau de neurones : %.2f%%\n', accuracy * 100);

%base de prentissage  fct combinaison  fct transfert  fct miseajr fct calcule des err ,test validation deploiment

