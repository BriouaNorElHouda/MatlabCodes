function imageLSB(coverImage, secretImage)
    
    coverImage = imread('nat.png');
    secretImage = imread('cam.png');

    for i = 1:size(secretImage, 1)
        for j = 1:size(secretImage, 2)
            
           pmat = coverImage(i, j, :);

            % njibou les 4 bits les plus significatifs de secretimage
            secretPixel = bitshift(secretImage(i, j), 4);

            % n5ebiw les 4 bits de secretimage dans les 4 bits (LSB)
            % decover img
            pmat = bitand(pmat, uint8(240)); % Garder les 4 bits les plus significatifs
            pmat = bitor(pmat, secretPixel); % Ajouter les 4 bits de l'image à cacher

            % N7etou le pixel dans l'image couverture
            coverrImage(i, j, :) = pmat;
            stegoimage =coverrImage;
        end
    end
    
    secrettImage = zeros(size(stegoimage, 1), size(stegoimage, 2), 'uint8');

    % Extraire l'image secrète des bits de poids faible
    for i = 1:size(stegoimage, 1)
        for j = 1:size(stegoimage, 2)
            secretPixel = bitand(stegoimage(i, j), uint8(15));
            secretPixel = bitshift(secretPixel, 4);
            eximage(i, j) = secretPixel;
           
        end
    end

    
% Afficher les images
    figure;
    subplot(1, 4, 1), imshow(coverImage), title('Image Couverture');
    subplot(1, 4, 2), imshow(secretImage), title('Image à Cacher');
    subplot(1, 4, 3), imshow(stegoimage), title('Image Résultante');
    subplot(1, 4, 4), imshow(eximage), title('Image Secrète Extraite');
    
   
end

