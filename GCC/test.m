%matlab est un interpreteur de command , chaque element est un matrice (1D,2D)
%en mode  interactif(workspace) (historique), executife , ligne de commande(file.m to save instruction)
A=[2 6 4 5 1 7 9];
B=[3 5 2 3 6 4 8];
vect = randi([-50, 50], 1, 100);
a='Nor el houda  ';
b='Brioua';
%
for i= 1:5
   L= A(1,:)+5;
    
end
na=[a b]
C=A+B;
C1=A.*B;%TERME A TERME ./ ou .%
disp( C1);
disp(L);
%plot(vect,'+')
hold on
plot(A,'+-'),plot(B,'o-'),
xlabel('its A');
ylabel('its B');
title('this is example');
grid on;
legend('signal A', 'Signal B');


