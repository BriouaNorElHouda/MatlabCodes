
img = imread('flower.png');

red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

d_red = distributed(red);
d_green = distributed(green);
d_blue = distributed(blue);

red = gather(d_red);
green = gather(d_green);
blue = gather(d_blue);

figure;
subplot ( 1,4,1 ) ; imshow(img); title ( 'ORIGINAL' ) ;
subplot ( 3,4,2 ) ; imshow(red); title ( 'RED' ) ;
subplot ( 3,4,3 ) ; imshow(green); title ('GREEN') ;
subplot ( 3,4,4 ) ; imshow (blue) ; title ( 'BLUE' ) ;
