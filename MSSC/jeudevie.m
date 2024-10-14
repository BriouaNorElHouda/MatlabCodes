function ngrid = jeudevie(grille)
grille = randi([0, 1], 100, 100);
   
    for i = 1:100
       
    for i = 1:size(grille, 1)
        for j = 1:size(grille, 2)
           
            voisines = grille(max(1, i-1):min(size(grille,1), i+1), max(1, j-1):min(size(grille,2), j+1));
            nvivante = sum(voisines(:)) - grille(i, j);
            %les reglessss
            if grille(i, j) == 1 && (nvivante < 2 || nvivante > 3)
                ngrid(i, j) = 0;
            elseif grille(i, j) == 0 && nvivante == 3
                ngrid(i, j) = 1;
            else
                ngrid(i, j) = grille(i, j);
            end
        end
    end
    
    
    
    
    imshow(grille,20);
    colormap([1 1 1; 0.4940 0.1840 0.5560])
    drawnow
    grille = ngrid; 
    
   
end
 
end
    


