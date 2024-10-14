function stego_image = hide_text_and_image_LSB(cover_image_path, text_to_hide, image_to_hide_path)
    % Load the cover image
    cover_image = imread(cover_image_path);

    % Check if the cover image is of type uint8
    if ~isa(cover_image, 'uint8')
        error('The cover image must be of type uint8.');
    end

    % Convert the text to binary
    text_binary = reshape(dec2bin(text_to_hide, 8).', 1, []);

    % Load the image to hide
    image_to_hide = imread(image_to_hide_path);

    % Check if the image to hide is of type uint8
    if ~isa(image_to_hide, 'uint8')
        error('The image to hide must be of type uint8.');
    end

    % Flatten the image to hide
    image_to_hide_flat = image_to_hide(:).';

    % Flatten the cover image
    cover_image_flat = cover_image(:).';

    % Hide text in the LSB of the cover image
    cover_image_flat = bitand(cover_image_flat, 254); % Set LSB to 0
    cover_image_flat = bitor(cover_image_flat, str2num(text_binary));

    % Hide the image in the LSB of the cover image
    cover_image_flat = bitand(cover_image_flat, 254); % Set LSB to 0
    cover_image_flat = bitor(cover_image_flat, image_to_hide_flat);

    % Reshape the modified cover image
    stego_image = reshape(cover_image_flat, size(cover_image));

    % Display the original and stego images
    figure;
    subplot(1, 2, 1);
    imshow(cover_image);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(stego_image);
    title('Stego Image');
end
