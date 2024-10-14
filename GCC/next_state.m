

function ngrid = jeudevie(grid)
grid = randi([0, 1], 100, 100);
    ngrid = zeros(size(grid));
    for i = 1:100
    for i = 1:size(grid, 1)
        for j = 1:size(grid, 2)
           
            voisines = grid(max(1, i-1):min(size(grid,1), i+1), max(1, j-1):min(size(grid,2), j+1));
            nvivante = sum(voisines(:)) - grid(i, j);
            %les reglessss
            if grid(i, j) == 1 && (nvivante < 2 || nvivante > 3)
                ngrid(i, j) = 0;
            elseif grid(i, j) == 0 && nvivante == 3
                ngrid(i, j) = 1;
            else
                ngrid(i, j) = grid(i, j);
            end
        end
    end
    
   
end
  imshow(grid, 'InitialMagnification', 'fit')
    colormap([1 1 1; 0 0 0])


 
    grid = jeudevie(grid);
    end

