function c = chiffrementRSA(m, e, n)
    % Chiffrer le message m avec la clé publique (n, e)
    c = modexp(m, e, n)
end

function result = modexp(base, exponent, modulus)
    % Calculer base^exponent mod modulus efficacement
    result = 1;
    base = mod(base, modulus);
    while exponent > 0
        if mod(exponent, 2) == 1
            result = mod(result * base, modulus);
        end
        exponent = floor(exponent / 2);
        base = mod(base * base, modulus);
    end
end