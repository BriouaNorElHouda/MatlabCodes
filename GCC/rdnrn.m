% Préparer les données
[X_train, Y_train, X_test_validation, Y_test_validation] = prepareData();

% Créer le réseau neuronal avec 0 neurone dans la couche cachée
net = createNeuralNetwork(0);

% Entraîner le réseau neuronal
net = trainNeuralNetwork(net, X_train, Y_train, 100); % 100 époques (modifiable)

% Tester le réseau neuronal
[Y_pred, test_error, accuracy] = testNeuralNetwork(net, X_test_validation, Y_test_validation);

% Afficher les résultats
disp(['Erreur de test : ', num2str(test_error)]);
disp(['Précision : ', num2str(accuracy * 100), '%']);

% Sauvegarder et déployer le modèle
saveAndDeployModel(net, 'trained_neural_network.mat');
