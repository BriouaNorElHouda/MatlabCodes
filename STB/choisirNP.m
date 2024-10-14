%Cryptographie Asymétrique RSA :utilisé pour le chiffrement et la signature électronique
%La première étape: c’est la création des clés (publique, et privée)
%1 Choisir p et q, deux nombres premiers distincts ;
function RSA()

% Choisir des nombres premiers aléatoires
function [p, q] = choisirNP()
    p = randNP()
    q = randNP()

    % S'assurer que p et q sont distincts
    while p == q
        q = randNP();
    end

end

function num = randNP()
    % Générer un nombre premier aléatoire dans une certaine plage
    plage = 50; % Plage de nombres premiers possibles
    num = randi([2, plage]);
    
    % Répéter jusqu'à ce qu'un nombre premier soit trouvé
    while ~estNP(num)
        num = randi([2, plage]);
    end
end
% Vérifier si un nombre est premier
function estPremier = estNP(num)
    estPremier = true;
    for i=2:(num/2)
        if  mod(num,i)==0
            estPremier = false;
            break;
        end
    end
end

%Calculer leur produit n = pq, appelé module de chiffrement 
     n = p*q

end
 
