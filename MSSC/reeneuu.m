 
X = [-4, 2; 2, 2; 3, -1; -4, -2; -2, -3; 4, -4];
Y = [1; 1; 1; -1; -1; -1];

w0 = [0.1;0.5] ;
b = 1; 
tauapr = 0.1; 

for i = 1:100
   
    a = sign(X*w0 + b);
   
    error = y - a;
   
    w0 = w0 + tauapr*X'*error;
    b = b + tauapr*sum(error);
end


x1 = linspace(0, 2, 100);
x2 = (-b - w0(1)*x1)/w0(2);
plot(X(:,1), X(:,2), 'o');
hold on;
plot(x1, x2);
axis([0 2 0 2]);
xlabel('x1');
ylabel('x2');
legend('Classe 0', 'Classe 1', 'Frontière de décision');
