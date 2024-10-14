
img = imread('flower.png');

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);

d_r = distributed(r);
d_g = distributed(g);
d_b = distributed(b);

r = gather(d_r);
g = gather(d_g);
b = gather(d_b);

figure;
subplot ( 1,4,1 ) ; imshow(img); title ( 'ORIGINAL' ) ;

subplot ( 1,4,2 ) ; imshow(r); title ( 'RED' ) ;
subplot ( 1,4,3 ) ; imshow(g); title ('GREEN') ;
subplot ( 1,4,4 ) ; imshow (b) ; title ( 'BLUE' ) ;
