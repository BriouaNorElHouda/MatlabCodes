load fisheriris
X = meas(1:100, :);  % Prendre les 100 premières lignes pour l'apprentissage
Y = [ones(50,1); 2*ones(50,1)];  % 1 pour la première espèce, 2 pour la deuxième espèce

% Données d'apprentissage (25 à 75)
X_train = [X(1:25, :); X(51:75, :)];
Y_train = [Y(1:25, :); Y(51:75, :)];

% Données de test (1 à 24 et 76 à 100)
X_test = [X(26:50, :); X(76:100, :)];
Y_test = [Y(26:50, :); Y(76:100, :)];


layers = [
    fullyConnectedLayer(10, 'InputSize', 4, 'Activation', 'relu')
    fullyConnectedLayer(2, 'Activation', 'softmax')
    classificationLayer
];

options = trainingOptions('adam', ...
    'MaxEpochs', 100, ...
    'MiniBatchSize', 10, ...
    'Shuffle', 'every-epoch', ...
    'Plots', 'training-progress');
net = trainNetwork(X_train', categorical(Y_train), layers, options);

Y_pred = classify(net, X_test');
accuracy = sum(Y_pred == categorical(Y_test)) / numel(Y_test);
fprintf('Précision du réseau de neurones : %.2f%%\n', accuracy * 100);
