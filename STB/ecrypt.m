function caesarCipher()
    % Prompt the user for encryption or decryption
    choice = input('Enter "e" for encryption or "d" for decryption: ', 's');

    if choice == 'e'
        % Encryption
        message = input('Enter the message to encrypt: ', 's');
        shift = input('Enter the shift value (an integer): ');

        encryptedMessage = encrypt(message, shift);
        disp(['Encrypted message: ', encryptedMessage]);
    elseif choice == 'd'
        % Decryption
        encryptedMessage = input('Enter the encrypted message: ', 's');
        shift = input('Enter the shift value (an integer): ');

        decryptedMessage = decrypt(encryptedMessage, shift);
        disp(['Decrypted message: ', decryptedMessage]);
    else
        disp('Invalid choice. Please enter "e" for encryption or "d" for decryption.');
    end
end

function encryptedMessage = encrypt(message, shift)
    encryptedMessage = '';
    for i = 1:length(message)
        charToEncrypt = message(i);
        if isletter(charToEncrypt)
            if islower(charToEncrypt)
                encryptedChar = char(mod(charToEncrypt - 'a' + shift, 26) + 'a');
            else
                encryptedChar = char(mod(charToEncrypt - 'A' + shift, 26) + 'A');
            end
        else
            encryptedChar = charToEncrypt; % Leave non-letter characters unchanged
        end
        encryptedMessage = [encryptedMessage, encryptedChar];
    end
end

function decryptedMessage = decrypt(encryptedMessage, shift)
    decryptedMessage = encrypt(encryptedMessage, -shift); % Decrypt by negating the shift
end

% Run the Caesar cipher program
caesarCipher();
