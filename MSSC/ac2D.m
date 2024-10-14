% Définir les paramètres du jeu de la vie
taille_grille = 100; % Taille de la grille (100x100)
nb_iterations = 100; % Nombre d'itérations à exécuter

% Initialisation de la grille
grille = randi([0,1],taille_grille); % Initialiser la grille avec des cellules aléatoirement mortes ou vivantes

% Boucle principale pour exécuter les itérations du jeu de la vie
for k = 1:nb_iterations
   
    % Parcourir chaque cellule de la grille
    for i = 1:taille_grille
        for j = 1:taille_grille
            % Calculer le nombre de voisins vivants
            nb_voisins_vivants = sum(grille(max(i-1,1):min(i+1,taille_grille), max(j-1,1):min(j+1,taille_grille)),'all') - grille(i,j);
            
            % Mettre à jour l'état de la cellule en fonction du nombre de voisins vivants
            if grille(i,j) == 1 % Si la cellule est vivante
                if nb_voisins_vivants < 2 || nb_voisins_vivants > 3
                    % La cellule meurt
                    grille_next(i,j) = 0;
                end
            else % Si la cellule est morte
                if nb_voisins_vivants == 3
                    % Une nouvelle cellule naît
                    grille_next(i,j) = 1;
                end
            end
        end
        
    end
    
    
    
    grille = grille_next;
    
  
    pause(20);
end
