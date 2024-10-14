% Fonction pour l'apprentissage et le test
function accuracy = trainAndTest(X_train, Y_train, X_test, Y_test, tauappr, iter)
    inputSize = size(X_train, 2);
    weights = rand(inputSize, 1);
    bias = rand();
    
    % Boucle d'apprentissage
    for epoch = 1:iter
        % Calcul des prédictions avec l'activation sur l'ensemble d'entraînement
        Y_pred_train = sigmoid(X_train * weights + bias);
        
        % Mise à jour des poids et du biais avec l'ensemble d'entraînement
        [weights, bias] = misajrs(X_train, Y_train, weights, bias, tauappr);
        
        % Calcul de l'erreur sur l'ensemble d'entraînement
        error_train = sum((Y_pred_train - Y_train).^2) / length(Y_train);
    end
    
    % Boucle de test
    Y_pred_test = round(sigmoid(X_test * weights + bias));
    %accuracy = (number of correct predictions) / (total number of predictions)
    accuracy = (sum(Y_pred_test == Y_test) / length(Y_test)) * 100;
end