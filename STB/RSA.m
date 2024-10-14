%Cryptographie Asymétrique RSA :utilisé pour le chiffrement et la signature électronique
%La première étape: c’est la création des clés (publique, et privée)
%1 Choisir p et q, deux nombres premiers distincts ;
function RSA()

% Choisir des nombres premiers aléatoires
function [p, q] = choisirNP()
    p = 3;
    q = 11;

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
[p, q] = choisirNP()
     n = p*q

     
 %calculer ?(n) = (p - 1)(q - 1)  ;
 fi_n = (p - 1)*(q - 1)
 
 %choisir un entier naturel e premier avec ?(n) et strictement inférieur à ?(n)
 %appelé exposant de chiffrement ;
 e = ExposantChiffrement(fi_n);
function e = ExposantChiffrement(fi_n)
    % Choisir un exposant de chiffrement e premier avec ?(n)
    % et strictement inférieur à ?(n)
    e = 3; 

    % Vérifier que e et ?(n) sont premiers entre eux (with some help)
    while gcd(e, fi_n) ~= 1   %gcd plus grand commun diviseur
        e = 3;
    end
end

%calculer l'entier naturel d, inverse de e modulo ?(n), et strictement inférieur à ?(n)
% appelé exposant de déchiffrement, ed ? 1 (mod ?(n));

d = modinv(e, fi_n);%the modular multiplicative inverse,
%modinv function that uses the Extended Euclidean Algorithm
%to calculate the modular multiplicative inverse.


 % Afficher les clés
    disp(['Clé publique (n, e): (' num2str(n) ', ' num2str(e) ')']);
    disp(['Clé privée (n, d): (' num2str(n) ', ' num2str(d) ')']);

    
    
   
   % Etape 02: Chiffrement des messages
  %  message = input('Enter the message to encrypt: ', 's');

    % Convertir le message en un nombre
  %  m = msgToNum(message);

    % Chiffrer le message
   % c = chiffrementRSA(m, e, n);
  %  disp(['Message chiffré (c): ' num2str(c)]);
    
    %OUT OF TIME 1:30
    % Etape 03: Déchiffrement des messages
  

end
 
