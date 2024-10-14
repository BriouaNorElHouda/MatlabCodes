function m_decrypt = dechiffrementRSA(c, d, n)
    % Déchiffrer le message chiffré c avec la clé privée (n, d)
    m_decrypt = modexp(c, d, n);
end

function str = numberToMessage(num)
    % Convertir le nombre en un message
    str = '';
    while num > 0
        str = [char(mod(num, 256)) str];
        num = floor(num / 256);
    end
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



%how to call
%  m_decrypt = dechiffrementRSA(c, d, n);
   % disp(['Message déchiffré: ' numberToMessage(m_decrypt)]);