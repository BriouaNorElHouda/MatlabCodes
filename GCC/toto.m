
X = [0, 0; 0, 1; 1, 0;1 , 1];
y = [1; 0; 0; 1];


w = rand(2, 1); 
b = 0.1; 

sigmoid = @(x) 1./(1+exp(-x));

ta = 0.001;

for i = 1:100
    
    y_prd = sigmoid(X*w + b);
    
    
    error = y - y_prd;
    
    % Mettre à jour les poids et le biais en fonction de l'erreur
    w = w + ta*X'*error;
    b = b + ta*sum(error);
end

% Tracer la frontière de décision
x1 = linspace(0, 2, 100);
x2 = (-b - w(1)*x1)/w(2);
plot(X(:,1), X(:,2), 'X');
hold on;
plot(x1, x2);
axis([0 2 0 2]);
xlabel('x1');
ylabel('x2');
legend('Classe 0', 'Hyperplan séparateur', 'Classe 1');
