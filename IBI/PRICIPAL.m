% Paramètres d'apprentissage
 t_appr = 0.01;
iter = 1000;

% Entraînement du réseau neuronal
train_neural_network(X_train, Y_train, t_appr, iter);

% Test du réseau neuronal
test_neural_network(X_test, Y_test, w, bias);
