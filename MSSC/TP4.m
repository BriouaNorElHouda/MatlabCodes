% Programme principal
load fisheriris;

%75%training
X_train = [meas(1:35, :); meas(51:90, :)];
Y_train = [ones(35, 1); 2 * ones(40, 1)];
%25%testing
X_test = [meas(36:50, :); meas(91:100, :)];
Y_test = [ones(15, 1); 2 * ones(10, 1)];


X_train = zscore(X_train);
X_test = zscore(X_test);

inputSize = size(X_train, 2);
ws = rand(inputSize, 1);
bias = 0.5;

tauappr = 0.01;
iter = 1000;

%%%%% Boucle d'apprentissage
for epoch = 1:iter
   
    p=combinaison(X_train,ws,bias);
    Y_pred = echelon(p);
    
    
    [ws, bias] = misajrs(X_train, Y_train, ws, bias, tauappr);
    
    error = sum((Y_pred - Y_train).^2) / length(Y_train);
  
end

%%%%%%% Boucle de test
testing(X_test,Y_test,Y_pred,ws,bias);

disp(ws);
figure;
scatter(X_train(Y_train == 1, 1), X_train(Y_train == 1, 2), 'g', 'filled'); hold on;
scatter(X_train(Y_train == 2, 1), X_train(Y_train == 2, 2), 'b', 'filled');


x_vals = linspace(min(X_train(:, 1)), max(X_train(:, 1)), 100);
y_vals = (-ws(1) * x_vals - bias) / ws(2);

x_vals = zscore(x_vals);
y_vals = zscore(y_vals);

plot(x_vals, y_vals, 'k-', 'LineWidth', 2);

title('2D Scatter Plot of Training Data with Accurate Decision Boundary');
legend('Class 1', 'Class 2', 'Decision Boundary');
xlabel('Feature 1');
ylabel('Feature 2');