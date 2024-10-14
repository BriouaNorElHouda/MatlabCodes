function extractLSB(stegoimage)
   
    % stegoimage = imread('stegoimage.png'); 
    % Initialiser une image vide pour stocker l'image secrète
    secretImage = zeros(size(stegoimage, 1), size(stegoimage, 2), 'uint8');

    % Extraire l'image secrète des bits de poids faible
    for i = 1:size(stegoimage, 1)
        for j = 1:size(stegoimage, 2)
            secretPixel = bitand(stegoimage(i, j), uint8(15));
            secretPixel = bitshift(secretPixel, 4);
            secretImage(i, j) = secretPixel;
           secimage = bitand(secretPixel, 254);%0000
        end
    end

    % Afficher les images dans un subplot
    figure;
    subplot(1, 2, 1), imshow(stegoimage), title('Image Stego');
    subplot(1, 2, 2), imshow(secimage), title('Image Secrète Extraite');
end
