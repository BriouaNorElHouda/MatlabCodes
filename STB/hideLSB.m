function image_result = hideLSB(image_cover, image_to_hide)

image_cover = imread('fpic.png');
image_to_hide = imread('spic-bw.png');
    % V�rifier que les images ont la m�me taille
    if size(image_cover) ~= size(image_to_hide)
        error('Les images doivent avoir la m�me taille.');
    end

    % Masque pour extraire les 4 bits les moins significatifs
    mask_LSB = uint8(2^4 - 1);

    % S�parer les canaux des images
    cover_channel = uint8(image_cover);
    to_hide_channel = uint8(image_to_hide);

    % Cacher les 4 bits les plus significatifs de l'image � cacher dans les 4 bits
    % les moins significatifs de l'image couverture
    hidden_channel = bitand(cover_channel, bitcmp(mask_LSB, 'uint8')) + ...
        bitshift(bitand(to_hide_channel, mask_LSB), 4);

    % Reconstruire l'image r�sultante
    image_result = uint8(hidden_channel);

    % Afficher les images
    figure;
    subplot(1, 3, 1), imshow(image_cover), title('Image Couverture');
    subplot(1, 3, 2), imshow(image_to_hide), title('Image � Cacher');
    subplot(1, 3, 3), imshow(image_result), title('Image R�sultante (LSB)');
end
