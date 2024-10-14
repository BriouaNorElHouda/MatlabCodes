function [X_train, Y_train, X_test_validation, Y_test_validation] = prepareData()
    % Charger la base de données Fisher Iris
    load fisheriris;

    % Sélectionner uniquement les 100 premiers échantillons pour l'apprentissage
    X_train = [meas(1:25,:); meas(51:75,:)];
    Y_train = [ones(25,1); 2*ones(25,1); 3*ones(25,1)];

    % Utiliser les échantillons restants pour le test et la validation
    X_test_validation = meas(26:50,:);
    Y_test_validation = [ones(25,1); 2*ones(25,1); 3*ones(25,1)];
end

function net = createNeuralNetwork(num_hidden_neurons)
    % Créer et configurer le réseau neuronal
    net = patternnet(num_hidden_neurons); % Nombre de neurones dans la couche cachée

    % Définir la fonction de transfert
    net.layers{1}.transferFcn = 'purelin'; % Couche linéaire

    % Diviser les données en apprentissage, test et validation
    net.divideFcn = 'dividerand';
    net.divideParam.trainRatio = 0.5; % 50% pour l'apprentissage
    net.divideParam.valRatio = 0.25; % 25% pour la validation
    net.divideParam.testRatio = 0.25; % 25% pour le test
end

function net = trainNeuralNetwork(net, X_train, Y_train, epochs)
    % Entraîner le réseau neuronal
    net.trainParam.epochs = epochs; % Nombre d'époques (modifiable)
    net.trainParam.showWindow = true; % Afficher la fenêtre de progression
    net = train(net, X_train', ind2vec(Y_train'));
end

function [Y_pred, test_error, accuracy] = testNeuralNetwork(net, X_test_validation, Y_test_validation)
    % Tester le réseau neuronal
    Y_pred = sim(net, X_test_validation');

    % Calculer l'erreur de test
    test_error = perform(net, ind2vec(Y_test_validation'), Y_pred);

    % Calculer la précision
    accuracy = sum(vec2ind(Y_pred) == vec2ind(ind2vec(Y_test_validation'))) / length(Y_test_validation);
end

function saveAndDeployModel(net, filename)
    % Déploiement du modèle
    save(filename, 'net');
    
    % Pour utiliser le modèle entraîné plus tard
    loaded_net = load(filename);
    deployed_net = loaded_net.net;

    % Utiliser deployed_net pour faire des prédictions sur de nouvelles données
    % new_data = ...; % Remplacez ceci par vos nouvelles données
    % predictions = sim(deployed_net, new_data');
end
