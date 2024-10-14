function caesarCipher()
    % Ask the user to choose encryption or decryption
    disp('Please select an option:');
    disp('1. Encrypt');
    disp('2. Decrypt');
    
   option = input('your option is: ', 's');
    %option = input('Enter "e" for encryption or "d" for decryption: ', 's');
   
   % Encryption
    if option == '1'
        message = input('Enter the message to encrypt: ', 's');
        Key = input('Enter the Key: ');

        encryptedMessage = encrypt(message, Key);
        disp(['Encrypted message: ', encryptedMessage]);
   % Decryption
    elseif option == '2'
        encryptedMessage = input('Enter the encrypted message: ', 's');
        Key = input('Enter the Key: ');

        decryptedMessage = decrypt(encryptedMessage, Key);
        disp(['Decrypted message: ', decryptedMessage]);
    else
        disp('Invalid choice. Please enter "1" for encryption or "2" for decryption.');
    end
end

function encryptedMessage = encrypt(message, Key)
    encryptedMessage = '';
    for i = 1:length(message)
        charToEncrypt = message(i);
        if isletter(charToEncrypt)
            if isstrprop(charToEncrypt, 'lower')
                encryptedChar = char(mod(charToEncrypt - 'a' + Key, 26) + 'a');
            else
                encryptedChar = char(mod(charToEncrypt - 'A' + Key, 26) + 'A');
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

