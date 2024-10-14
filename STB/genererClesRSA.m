function [n, e, d] = genererClesRSA()

    % Choisir p et q, deux nombres premiers distincts
    [p, q] = choisirNombresPremiers();

    % Calculer le module de chiffrement n = pq
    n = p * q;

    % Calculer ?(n) = (p - 1)(q - 1)
    phi_n = (p - 1) * (q - 1);

    % Choisir un exposant de chiffrement e
    e = choisirExposantChiffrement(phi_n);

    % Calculer l'exposant de déchiffrement d
    d = modinv(e, phi_n);

    % Afficher les clés
    disp(['Clé publique (n, e): (' num2str(n) ', ' num2str(e) ')']);
    disp(['Clé privée (n, d): (' num2str(n) ', ' num2str(d) ')']);

    % Définition de fonctions
    function [p, q] = choisirNombresPremiers()
        p = nombrePremierAleatoire();
        q = nombrePremierAleatoire();
        while p == q
            q = nombrePremierAleatoire();
        end
    end

    function nombre = nombrePremierAleatoire()
        plage = 100;
        nombre = randi([2, plage]);
        while ~estNombrePremier(nombre)
            nombre = randi([2, plage]);
        end
    end

    function estPremier = estNombrePremier(n)
        estPremier = true;
        for i = 2:sqrt(n)
            if rem(n, i) == 0
                estPremier = false;
                break;
            end
        end
    end

    function e = choisirExposantChiffrement(phi_n)
        e = randi([2, phi_n - 1]);
        while gcd(e, phi_n) ~= 1
            e = randi([2, phi_n - 1]);
        end
    end

    function d = modinv(a, m)
        [g, d, ~] = extendedEuclidean(a, m);
        if g ~= 1
            error('Inverse modulo does not exist');
        end
    end

    function [g, x, y] = extendedEuclidean(a, b)
        if b == 0
            g = a;
            x = 1;
            y = 0;
        else
            [g, x, y] = extendedEuclidean(b, mod(a, b));
            temp = x;
            x = y;
            y = temp - floor(a/b) * y;
        end
    end

end
