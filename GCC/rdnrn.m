% Pr�parer les donn�es
[X_train, Y_train, X_test_validation, Y_test_validation] = prepareData();

% Cr�er le r�seau neuronal avec 0 neurone dans la couche cach�e
net = createNeuralNetwork(0);

% Entra�ner le r�seau neuronal
net = trainNeuralNetwork(net, X_train, Y_train, 100); % 100 �poques (modifiable)

% Tester le r�seau neuronal
[Y_pred, test_error, accuracy] = testNeuralNetwork(net, X_test_validation, Y_test_validation);

% Afficher les r�sultats
disp(['Erreur de test : ', num2str(test_error)]);
disp(['Pr�cision : ', num2str(accuracy * 100), '%']);

% Sauvegarder et d�ployer le mod�le
saveAndDeployModel(net, 'trained_neural_network.mat');
