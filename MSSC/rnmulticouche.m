% Données d'entraînement
X = [0 0; 0 1; 1 0; 1 1];
Y = [1; 0; 0; 1];

% Vérification de la taille des données d'entraînement
assert(size(X, 1) == size(Y, 1), 'Erreur : nombre de lignes dans X doit être égal au nombre de lignes dans Y');
X = [ones(size(X,1), 1) X];
% Nombre de neurones dans chaque couche
n_inputs = size(X, 2);
n_hidden = 2;
n_outputs = 1;

% Initialisation aléatoire des poids
W1 = rand(2, 2);
b1 = rand(1, 2);

W2 = rand(2, 1);
b2 = rand(1, 1);

% Fonction d'activation (sigmoid)
sigmoid = @(x) 1./(1+exp(-x));

% Taux d'apprentissage
eta = 0.01;

% Boucle d'apprentissage
for i = 1:5000
    for j = 1 : size(X, 1)
    % Propagation avant
    z1 =X(j, :) * W1;
    z1=z1 + b1;
    
    
    a1 = sigmoid(z1);
    z2 = [ones(size(a1, 1), 1) a1] * W2 + b2;
    Y_pred = sigmoid(z2);
    
    % Calcul de l'erreur
    delta2 = (Y_pred - Y).*Y_pred.*(1-Y_pred);
    delta1 = delta2*W2(2:end,:)'.*a1.*(1-a1);
    
    % Mise à jour des poids
    W2 = W2 - eta*[ones(size(a1, 1), 1) a1]'*delta2;
    b2 = b2 - eta*sum(delta2);
    W1 = W1 - eta*X'*delta1;
    b1 = b1 - eta*sum(delta1);
    end
end

% Prédiction sur les données d'entraînement
X = [ones(size(X, 1), 1) X];
Y_pred = round(sigmoid([ones(size(sigmoid(X*W1 + b1), 1), 1) sigmoid(X*W1 + b1)]*W2 + b2));

% Affichage des résultats
disp('Sortie du réseau :');
disp(Y_pred);
