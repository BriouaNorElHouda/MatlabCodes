function encryptedText = vigenereEncrypt(message, key)
    
    message = upper(message);
    key = upper(key);
    lenmessage = length(message);
    lenKey = length(key);
    encryptedText = '';
    
    for i = 1:lenmessage
        if isletter(message(i))
            shift = mod(key(mod(i-1, lenKey) + 1) - 'A', 26);
            encryptedChar = mod(message(i) + shift - 'A' + 1, 26) + 'A';
            encryptedText = [encryptedText, char(encryptedChar)];
        else
            encryptedText = [encryptedText, message(i)];
        end
    end
end
