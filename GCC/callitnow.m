% Programme principal
load fisheriris;

% S�paration des donn�es en ensembles d'entra�nement et de test
X_train = [meas(1:25, :); meas(51:75, :)];
Y_train = [ones(25, 1); 2 * ones(25, 1)];

X_test = [meas(26:50, :); meas(76:100, :)];
Y_test = [ones(25, 1); 2 * ones(25, 1)];

% Normalisation des donn�es
X_train = zscore(X_train);
X_test = zscore(X_test);

% Param�tres d'apprentissage
tauappr = 0.01;
iter = 1000;

% Appel de la fonction pour l'apprentissage et le test
accuracy = trainAndTest(X_train, Y_train, X_test, Y_test, tauappr, iter);

disp(['Accuracy du r�seau de neurones sur les donn�es de test : ' num2str(accuracy) '%']);
