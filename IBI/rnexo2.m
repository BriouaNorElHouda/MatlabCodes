% Définir les données d'entrée et les sorties cibles
X = [0 0; 0 1; 1 0; 1 1];
Y = [1; 0; 0; 1];


W1 = rand(2,2);
W2 = rand(1,2);
taux_apprent = 0.01;
b=0.1;
sigmoid = @(x) 1./(1+exp(-x));

% Boucle d'apprentissage
for i = 1:50000
    
    d=a*b+(a*x);
    % Propagation avant
    sort_cach = 1./(1 + exp(-X*W1'));
    sort_sortie = 1./(1 + exp(- sort_cach*W2'));
    
    % Calcul de l'erreur
    err2 = (Y -  sort_sortie).* sort_sortie.*(1- sort_sortie);
    err1 = err2*W2.* sort_cach.*(1- sort_cach);
    
    % Mise à jour des poids
    W2 = W2 + taux_apprent*err2'* sort_cach;
    W1 = W1 +taux_apprent*err1'*X;
end

% Vérification de l'apprentissage
sort_cach = 1./(1 + exp(-X*W1'));
sort_sortie = round(1./(1 + exp(-sort_cach*W2')));

% Affichage des résultats

disp('Sorts cibles:');
disp(Y);
disp('Sorts estimées:');
disp(sort_sortie);