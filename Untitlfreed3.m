coverText = 'This is the cover text.';
secretMessage = 'This is the hidden message.';
encryptionKey = 'SecretKey';

% Hide and encrypt the message
encodedText = hideAndEncryptMessage(coverText, secretMessage, encryptionKey);

disp('Cover Text:');
disp(coverText);
disp('Encoded Text:');
disp(encodedText);

% Decrypt the hidden message
decodedMessage = decryptMessage(encodedText, encryptionKey);

disp('Decoded Message:');
disp(decodedMessage);
