

% D�finir les donn�es d'entr�e et les sorties cibles
X = [0, 0; 0, 1; 1, 0; 1, 1];
Y = [1; 0; 0; 1];

% Ajouter un biais de valeur 1 aux donn�es d'entr�e
X = [ones(size(X,1), 1) X];

% Initialiser les poids al�atoirement, y compris le biais
W1 = rand(2,3);
W2 = rand(1,3);

% D�finir la fonction d'activation sigmo�de
sigmoid = @(x) 1./(1 + exp(-x));

% D�finir les param�tres d'apprentissage
taux_apprent = 0.01;

% Boucle d'apprentissage
for npr_ite = 1:50000
    
    % Propagation avant
    sort_cach = sigmoid(X*W1');
    sort_cach = [ones(size(sort_cach,1), 1) sort_cach]; % Ajouter le biais � la couche cach�e
    sort_sortie = sigmoid(sort_cach*W2');
    
    % Calcul de l'erreur
   err2 = (Y - sort_sortie).*sort_sortie.*(1-sort_sortie);
    err1 = (err2*W2).*sort_cach.*(1-sort_cach);
    
    % Mise � jour des poids
    W2 = W2 + taux_apprent*err2'*sort_cach;
    W1 = W1 + taux_apprent*err1(:,2:end)'*X;
end

% V�rification de l'apprentissage
sort_cach = sigmoid(X*W1');
sort_cach = [ones(size(sort_cach,1), 1) sort_cach]; % Ajouter le biais � la couche cach�e
sort_sortie = round(sigmoid(sort_cach*W2'));

% Affichage des r�sultats

disp('Sorties cibles:');
disp(Y);
disp('Sorties estim�es:');
disp(sort_sortie);
