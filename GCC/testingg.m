x = imread ('bird.tif ') ;
y = imnoise ( x , 'salt & pepper' , 0.30 ) ;
yd=distributed(y);
  spmd
      yl = getLocalPart ( yd ) ;
      yl = medfilt2 (yl , [4,4] ) ;
      size(yl)
  end
z(1:256 , 1:256 , 1 ) = yl {1};
z(1:256 , 1:256 , 2 ) = yl {2};
z(1:256 , 1:256 , 3 ) = yl {3};
figure ;
subplot ( 1,3,1 ) ; imshow ( x ) ; title ( 'X ' ) ;
subplot ( 1,3,2 ) ; imshow ( y ) ; title ( 'Y ' ) ;
subplot ( 1,3,3 ) ; imshow ( z ) ; title ( 'Z ' ) ;
