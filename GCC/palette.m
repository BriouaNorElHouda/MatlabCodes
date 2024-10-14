% Load the indexed color image and the secret message
indexedImage = imread('nat.png');
secretMessage = 'Hello, World!';

% Convert the image to double for processing
indexedImage = double(indexedImage);

% Flatten the image matrix and extract the color indices
indices = indexedImage(:);

% Convert the secret message to a binary string
binaryMessage = reshape(dec2bin(double(secretMessage), 8).', 1, []);

% Ensure the message fits within the available indices
if length(binaryMessage) > length(indices)
    error('Message is too long for the image.');
end

% Embed the binary message using a more complex palette modification
binaryMessage = logical(binaryMessage-'0');
indices(1:length(binaryMessage)) = bitxor(indices(1:length(binaryMessage)), double(binaryMessage));

% Reshape the modified indices back to the image size
modifiedImage = reshape(indices, size(indexedImage));

% Display the original and modified images
figure;
subplot(1, 2, 1); imshow(uint8(indexedImage)); title('Original Image');
subplot(1, 2, 2); imshow(uint8(modifiedImage)); title('Stego Image');

% Save the stego image
imwrite(uint8(modifiedImage), 'stego_indexed_image.png');
