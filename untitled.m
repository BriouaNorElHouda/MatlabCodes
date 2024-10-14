% Définir le nombre de cellules
n = 50;

% Initialisation de la configuration initiale
initial_config = zeros(1, n);
initial_config(round(n/2)) = 1;

% Initialisation de la configuration suivante
next_config = zeros(1, n);

% Définir la règle de transition
rule = [0 1 0 1 1 0 1 0];

% Nombre d'itérations
num_iterations = 50;

% Boucle principale pour simuler les itérations
for i = 1:num_iterations
    % Appliquer la règle de transition
    for j = 2:n-1
        % Obtenir la configuration actuelle des cellules voisines
        neighborhood = initial_config(j-1:j+1);
        % Convertir la configuration en indice binaire
        index = bin2dec(num2str(neighborhood));
        % Appliquer la règle
        next_config(j) = rule(index+1);
    end
    % Mettre à jour la configuration initiale
    initial_config = next_config;
    % Afficher la configuration actuelle
    disp(initial_config);
end
