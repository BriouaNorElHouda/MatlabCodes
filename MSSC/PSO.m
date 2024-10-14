% Param�tres du PSO
nbr_it = 100;
Nbpop =50;
omega = 1; %coef dinertie
C1 = 2; %coef dattraction
C2 = 2;

% D�finition des bornes pour chaque ingr�dient
F = [100, 250];
S = [30, 125];
B = [50, 125];
L = [12, 40];

% Initialisation des particules x =position de particule
x = rand(Nbpop, 4);
x(:, 1) = x(:, 1) * (F(2) - F(1)) + F(1);
x(:, 2) = x(:, 2) * (S(2) - S(1)) + S(1);
x(:, 3) = x(:, 3) * (B(2) - B(1)) + B(1);
x(:, 4) = x(:, 4) * (L(2) - L(1)) + L(1);

% Initialisation des vitesses de les particules
v = rand(Nbpop, 4);

% Initialisation des meilleures positions historiques
mp = x;

% Boucle principale du PSO
for i = 1:nbr_it
    % Calcul de la valeur de la fonction de go�t(la valeur) pour chaque particule
    GB = ((x(:, 1).^2 + x(:, 2).^2 + x(:, 3).^2 + x(:, 4).^2) ./ ...
        (cos(x(:, 1)) .* cos(x(:, 2)) .* cos(x(:, 3)) .* cos(x(:, 4))));

    % Mise � jour des meilleures positions historiques
    mp(GB < ((mp(:, 1).^2 + mp(:, 2).^2 + mp(:, 3).^2 + mp(:, 4).^2) ./ ...
        (cos(mp(:, 1)) .* cos(mp(:, 2)) .* cos(mp(:, 3)) .* cos(mp(:, 4)))), :) = x(GB < ((mp(:, 1).^2 + mp(:, 2).^2 + mp(:, 3).^2 + mp(:, 4).^2) ./ ...
        (cos(mp(:, 1)) .* cos(mp(:, 2)) .* cos(mp(:, 3)) .* cos(mp(:, 4)))), :);

    % Trouver la meilleure position globale
    [mv, im] = min(GB);
    mpg = x(im, :);

    % Mise � jour des vitesses et positions
    v = omega * v + C1 * rand(Nbpop, 4) .* (mp - x) + C2 * rand(Nbpop, 4) .* (repmat(mpg, Nbpop, 1) - x);
    x = x + v;

    % Limiter les positions dans les bornes d�finies
    x = max(x, repmat([F(1), S(1), B(1), L(1)], Nbpop, 1));
    x = min(x, repmat([F(2), S(2), B(2), L(2)], Nbpop, 1));

    % Affichage de la meilleure valeur de la fonction de go�t � chaque it�ration
   % fprintf('It�ration %d : best go�t = %.4f\n', i, mv);
end

% Affichage des valeurs optimales des ingr�dients
fprintf('\nValeurs optimales des ingr�dients :\n');
fprintf('Farine (F): %.2f g\n', mpg(1));
fprintf('Sucre (S): %.2f g\n', mpg(2));
fprintf('Beurre (B): %.2f g\n', mpg(3));
fprintf('Levure chimique (L): %.2f g\n', mpg(4));
