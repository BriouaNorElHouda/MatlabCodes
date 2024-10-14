

% Définir les données d'entrée et les sorties cibles
X = [0, 0; 0, 1; 1, 0; 1, 1];
Y = [1; 0; 0; 1];

% Ajouter un biais de valeur 1 aux données d'entrée
X = [ones(size(X,1), 1) X];

% Initialiser les poids aléatoirement, y compris le biais
W1 = rand(2,3);
W2 = rand(1,3);

% Définir la fonction d'activation sigmoïde
sigmoid = @(x) 1./(1 + exp(-x));

% Définir les paramètres d'apprentissage
taux_apprent = 0.01;

% Boucle d'apprentissage
for npr_ite = 1:50000
    
    % Propagation avant
    sort_cach = sigmoid(X*W1');
    sort_cach = [ones(size(sort_cach,1), 1) sort_cach]; % Ajouter le biais à la couche cachée
    sort_sortie = sigmoid(sort_cach*W2');
    
    % Calcul de l'erreur
   err2 = (Y - sort_sortie).*sort_sortie.*(1-sort_sortie);
    err1 = (err2*W2).*sort_cach.*(1-sort_cach);
    
    % Mise à jour des poids
    W2 = W2 + taux_apprent*err2'*sort_cach;
    W1 = W1 + taux_apprent*err1(:,2:end)'*X;
end

% Vérification de l'apprentissage
sort_cach = sigmoid(X*W1');
sort_cach = [ones(size(sort_cach,1), 1) sort_cach]; % Ajouter le biais à la couche cachée
sort_sortie = round(sigmoid(sort_cach*W2'));

% Affichage des résultats

disp('Sorties cibles:');
disp(Y);
disp('Sorties estimées:');
disp(sort_sortie);
