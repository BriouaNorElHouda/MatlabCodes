function ciphertext = chiffrement_bloc_ecb(plaintext, key)
    % Vérifier si la longueur de la clé est correcte (128, 192 ou 256 bits)
    if ~(numel(key) == 16 || numel(key) == 24 || numel(key) == 32)
        error('La longueur de la clé doit être de 16, 24 ou 32 octets.');
    end

    % Vérifier si la longueur du texte en clair est un multiple de 16 (AES bloc taille)
    if mod(numel(plaintext), 16) ~= 0
        error('La longueur du texte en clair doit être un multiple de 16 octets.');
    end

    % Initialiser le chiffrement AES avec la clé
    aes = aesinit(key, 'Mode', 'ECB');

    % Chiffrer le texte en clair par bloc
    num_blocks = numel(plaintext) / 16;
    ciphertext = zeros(size(plaintext));

    for i = 1:num_blocks
        block_start = (i - 1) * 16 + 1;
        block_end = i * 16;
        block = plaintext(block_start:block_end);

        % Chiffrer le bloc en utilisant AES
        encrypted_block = aesencrypt(aes, block);

        % Stocker le bloc chiffré dans le texte chiffré final
        ciphertext(block_start:block_end) = encrypted_block;
    end

    % Fermer l'objet AES
    aes = aesinit([], 'Release', aes);

    % Afficher le résultat (en format hexadécimal)
    disp('Texte en clair:');
    disp(plaintext);
    disp('Texte chiffré en format hexadécimal:');
    disp(dec2hex(ciphertext));
end



% Exemple d'utilisation
texte_clair = '0123456789ABCDEF0123456789ABCDEF';
cle = '00112233445566778899AABBCCDDEEFF';

chiffrement_bloc_ecb(texte_clair, cle);

