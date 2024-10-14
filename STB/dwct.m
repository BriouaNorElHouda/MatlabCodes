% Load the cover image and convert it to double
coverImage = imread('nat.png');
coverImage = double(coverImage);

% Convert text message to binary
textMessage = 'Hello, World!';
binaryMessage = reshape(dec2bin(double(textMessage), 8).', 1, []);

% Apply DWT to the cover image
[LL, LH, HL, HH] = dwt2(coverImage, 'haar');

% Ensure the binary message fits within the LH coefficients
binaryMessage = resizeBinaryMessage(binaryMessage, numel(LH));

% Embed the binary message in the LSBs of LH coefficients
LH = bitset(LH, 1, binaryMessage=='1');

% Reconstruct the stego image
stegoImage = idwt2(LL, LH, HL, HH, 'haar', size(coverImage));

% Display the original and stego images
figure;
subplot(1, 2, 1); imshow(uint8(coverImage)); title('Original Image');
subplot(1, 2, 2); imshow(uint8(stegoImage)); title('Stego Image');

% Function to resize the binary message
function resizedMessage = resizeBinaryMessage(binaryMessage, targetSize)
    currentSize = numel(binaryMessage);
    if currentSize < targetSize
        % If the message is shorter, repeat it to match the target size
        repetitions = ceil(targetSize / currentSize);
        resizedMessage = repmat(binaryMessage, 1, repetitions);
    else
        % If the message is longer, truncate it to match the target size
        resizedMessage = binaryMessage(1:targetSize);
    end
end
