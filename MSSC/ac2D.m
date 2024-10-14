% D�finir les param�tres du jeu de la vie
taille_grille = 100; % Taille de la grille (100x100)
nb_iterations = 100; % Nombre d'it�rations � ex�cuter

% Initialisation de la grille
grille = randi([0,1],taille_grille); % Initialiser la grille avec des cellules al�atoirement mortes ou vivantes

% Boucle principale pour ex�cuter les it�rations du jeu de la vie
for k = 1:nb_iterations
   
    % Parcourir chaque cellule de la grille
    for i = 1:taille_grille
        for j = 1:taille_grille
            % Calculer le nombre de voisins vivants
            nb_voisins_vivants = sum(grille(max(i-1,1):min(i+1,taille_grille), max(j-1,1):min(j+1,taille_grille)),'all') - grille(i,j);
            
            % Mettre � jour l'�tat de la cellule en fonction du nombre de voisins vivants
            if grille(i,j) == 1 % Si la cellule est vivante
                if nb_voisins_vivants < 2 || nb_voisins_vivants > 3
                    % La cellule meurt
                    grille_next(i,j) = 0;
                end
            else % Si la cellule est morte
                if nb_voisins_vivants == 3
                    % Une nouvelle cellule na�t
                    grille_next(i,j) = 1;
                end
            end
        end
        
    end
    
    
    
    grille = grille_next;
    
  
    pause(20);
end
