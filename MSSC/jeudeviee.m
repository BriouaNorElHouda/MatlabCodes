
N = 100;
grille = zeros(N+2, N+2);
grille(2:N+1, 2:N+1) = randi([0, 1], 100, 100);
G =(grille);
for i = 1:100
    grille = zeros(N+2, N+2);
    for row = 2:N+1
       for col = 2:N+1
          
          n = G(row-1, col-1)+G(row-1, col+1)+G(row+1, col-1)+G(row+1, col+1)+ G(row-1, col)+G(row, col-1)+G(row, col+1)+G(row+1, col);
           
           if (G(row, col)== 1) && ((n < 2) || (n > 3))
               grille(row, col) = 0;
          
           elseif (G(row, col)== 1) && ((n == 2) || (n == 3))
               grille(row, col) = 1;
          
           elseif (G(row, col)== 0) && (n == 3)
              grille(row, col) = 1;
           end

       end
     
    end
    G = grille;
    pause(0.01)
   
    spy(G);
    colormap([1 1 1; 0.4940 0.1840 0.5560])
    drawnow
end