function vect = Mut_int(vect, Pm)
    % Appliquer la mutation par inversion
    for i = 1:size(vect, 1)
        if rand() < Pm
            % Choix du point: changer une position aléatoire 
            position = randi(length(vect(i, :)));
            
            % Inversion de l'élément à la position choisie
            vect(i, position) = randperm(length(vect(i, :)), 1);
        end
    end
end