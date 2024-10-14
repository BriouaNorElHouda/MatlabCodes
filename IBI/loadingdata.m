load fisheriris; 
% S�lectionne les 100 premi�res observations (25 � 75 pour l'apprentissage)
X_train = [meas(1:25, :); meas(51:75, :)];
Y_train = [ones(25, 1); 2 * ones(25, 1)];

X_test = [meas(26:50, :); meas(76:100, :)];
Y_test = [ones(25, 1); 2 * ones(25, 1)];

% Normalisation des donn�es
X_train = zscore(X_train);
X_test = zscore(X_test);
