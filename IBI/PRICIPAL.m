% Param�tres d'apprentissage
 t_appr = 0.01;
iter = 1000;

% Entra�nement du r�seau neuronal
train_neural_network(X_train, Y_train, t_appr, iter);

% Test du r�seau neuronal
test_neural_network(X_test, Y_test, w, bias);
