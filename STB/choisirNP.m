%Cryptographie Asym�trique RSA :utilis� pour le chiffrement et la signature �lectronique
%La premi�re �tape: c�est la cr�ation des cl�s (publique, et priv�e)
%1 Choisir p et q, deux nombres premiers distincts ;
function RSA()

% Choisir des nombres premiers al�atoires
function [p, q] = choisirNP()
    p = randNP()
    q = randNP()

    % S'assurer que p et q sont distincts
    while p == q
        q = randNP();
    end

end

function num = randNP()
    % G�n�rer un nombre premier al�atoire dans une certaine plage
    plage = 50; % Plage de nombres premiers possibles
    num = randi([2, plage]);
    
    % R�p�ter jusqu'� ce qu'un nombre premier soit trouv�
    while ~estNP(num)
        num = randi([2, plage]);
    end
end
% V�rifier si un nombre est premier
function estPremier = estNP(num)
    estPremier = true;
    for i=2:(num/2)
        if  mod(num,i)==0
            estPremier = false;
            break;
        end
    end
end

%Calculer leur produit n = pq, appel� module de chiffrement 
     n = p*q

end
 
