% Load the cover image
coverImage = imread('bottle.jpg');
coverImage = double(coverImage);

% Convert text message to binary
textMessage = 'Hello, World!';
binaryMessage = reshape(dec2bin(double(textMessage), 8).', 1, []);

% Image dimensions
[M, N] = size(coverImage);

% Block size
blockSize = 8;

% Apply 2D DCT to image blocks
dctCoefficients = zeros(M, N);

for i = 1:blockSize:M
    for j = 1:blockSize:N
        block = coverImage(i:i+blockSize-1, j:j+blockSize-1);
        dctBlock = dct2(block);
        dctCoefficients(i:i+blockSize-1, j:j+blockSize-1) = dctBlock;
    end
end

% Embed the binary message in the LSBs of selected DCT coefficients
selectedCoefficients = [1 2; 2 1; 3 1];  % Example: Modify the first three coefficients
dctCoefficients = modifyDCTCoefficients(dctCoefficients, selectedCoefficients, binaryMessage);

% Inverse DCT to obtain the stego image
stegoImage = zeros(M, N);

for i = 1:blockSize:M
    for j = 1:blockSize:N
        dctBlock = dctCoefficients(i:i+blockSize-1, j:j+blockSize-1);
        block = idct2(dctBlock);
        stegoImage(i:i+blockSize-1, j:j+blockSize-1) = block;
    end
end

% Display the original and stego images
figure;
subplot(1, 2, 1); imshow(uint8(coverImage)); title('Original Image');
subplot(1, 2, 2); imshow(uint8(stegoImage)); title('Stego Image');

% Function to modify DCT coefficients
function modifiedCoefficients = modifyDCTCoefficients(coefficients, indices, binaryMessage)
    modifiedCoefficients = coefficients;
    for i = 1:length(indices)
        [row, col] = indices(i, :);
        modifiedCoefficients(row, col) = bitset(modifiedCoefficients(row, col), 1, binaryMessage(i)=='1');
    end
end

