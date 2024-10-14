function  stegoimage = LSB(message,cover_image)

message = 'HELLO';
cover_image = imread('flower.png');

 % Convert the text to binary
    btext = reshape(dec2bin(message, 8).', 1, [])

 % Flatten the cover image
    cover_imagef = cover_image(:).';

    % Hide text in the LSB of the cover image
    cover_imagef = bitand(cover_imagef, 254); % Set LSB to 0
    cover_imagef = bitor(cover_imagef, str2num(btext));
 % Reshape the modified cover image
    stego_image = reshape(cover_imagef, size(cover_image));
    %Get text hided in the LSB of the cover image
   
    % Display the original and stego images
    figure;
    subplot(1, 2, 1);
    imshow(cover_image);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(stego_image);
    title('Stego Image');
    

end