% som = 0; % initialisation
% x= [1 1 0 3];
% for i = 1:length(x)
% som = som+x(i)
% end
% 
som = 0; % initialisation
fin = 0; % variable logique qui nous servira à arrêter la boucle
x= [1 1 3 7];
while not(fin)
    for i = 1:length(x)
    som = som+x(i);
   if i < length(x)
      
   else
     fin = 1; % pour arrêter la boucle
   end
    end
end

disp(som);