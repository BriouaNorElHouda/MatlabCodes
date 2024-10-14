% Load the cover image
coverImage = imread('nat.png');
coverImage = double(coverImage);

% Convert text message to binary
textMessage = 'Hello, World!';
binaryMessage = reshape(dec2bin(double(textMessage), 8).', 1, []);

% Apply 2D DCT to image blocks
dctCoefficients = blkproc(coverImage, [8 8], @(block) dct2(block));

% Spread Spectrum Embedding
spreadFactor = 10; % Adjust the spreading factor as needed
spreadCode = randi([0, 1], size(dctCoefficients));

% Embed the binary message in the DCT coefficients using spread spectrum
dctSpread = dctCoefficients + spreadFactor * spreadCode;

% Reveal the embedded message (optional, just for demonstration purposes)
revealedSpreadCode = (dctSpread - dctCoefficients) / spreadFactor;

% Apply inverse DCT to obtain the stego image
stegoImage = blkproc(dctSpread, [8 8], @(block) idct2(block));

% Display the original and stego images
figure;
subplot(1, 3, 1); imshow(uint8(coverImage)); title('Original Image');
subplot(1, 3, 2); imshow(uint8(revealedSpreadCode)); title('Revealed Spread Code');
subplot(1, 3, 3); imshow(uint8(stegoImage)); title('Stego Image');
