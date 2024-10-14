%programme 1
%matlabpool open local  4
clc
spmd
    a=16;
    x=labindex*2+1;
   switch labindex
    case 1
        for k=2:numlabs
            a=a+labReceive(k);
            x=x+a;
        end
    case 2 
        labSend(a-3*x,1);
        x=x+1;
        
    case 3
         labSend(a*x,1);
         x=x+a;
         a=a+1;
    case 4
        labSend(a*x,1);
        x=x+a;
        a=a*2;
   
   end
        
end
          disp(x{1});  disp(a{1}); 
           disp(x{2});  disp(a{2}); 
            disp(x{3});   disp(a{3});
             disp(x{4});   disp(a{4});
             
             
