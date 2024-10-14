% Programme principal
load fisheriris;
%75%training
X_train = [meas(1:35, :); meas(51:90, :)];
Y_train = [ones(35, 1); 2 * ones(40, 1)];
%10%validation
X_val = [meas(36:40, :); meas(91:95, :)];
Y_val = [ones(5, 1); 2 * ones(5, 1)];
%15%testing
X_test = [meas(41:50, :); meas(96:100, :)];
Y_test = [ones(10, 1); 2 * ones(5, 1)];

X_train = zscore(X_train);
X_val = zscore(X_val);
X_test = zscore(X_test);

inputSize = size(X_train, 2);
ws = rand(inputSize, 1);
bias = 0.5;

tauappr = 0.01;
iter = 1000;

% Boucle d'apprentissage
for epoch = 1:iter
   
    Y_pred_train = sigmoid(X_train * ws + bias);
    
    [ws, bias] = misajrs(X_train, Y_train, ws, bias, tauappr);
    
    error_train = sum((Y_pred_train - Y_train).^2) / length(Y_train);
    
    Y_pred_val = sigmoid(X_val * ws + bias);
    
    error_val = sum((Y_pred_val - Y_val).^2) / length(Y_val);
    
    disp(['Iter: ' num2str(epoch) ', Training Error: ' num2str(error_train) ', Validation Error: ' num2str(error_val)]);
end

% Boucle de test
Y_pred_test = round(sigmoid(X_test * ws + bias));
accuracy = (sum(Y_pred_test ) / length(Y_test)) * 100;

disp(['Accuracy du réseau de neurones : ' num2str(accuracy) '%']);
