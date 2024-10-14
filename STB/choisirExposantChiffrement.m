function d = modinv(a, m)
    % Calculer le modular multiplicative inverse de a modulo m
    [g, d, ~] = extendedEuclidean(a, m);
    
    if g ~= 1
        error('Inverse modulo does not exist');
    end
end

function [g, x, y] = extendedEuclidean(a, b)
    % Algorithme d'Euclide étendu pour calculer le plus grand commun diviseur et les coefficients de Bézout
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