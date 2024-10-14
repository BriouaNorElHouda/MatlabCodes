%matlabpool open local 4
mat = randi(4,4)
vect=zeros(1,3);
spmd
    switch labindex
        case 1
        w1= sum(mat(:));
        labSend(w1,4);
        case 2
            w2= prod(mat(:));
        labSend(w2,4);
        case 3
            w3=mean(mat(:));
        labSend(w3,4);
        case 4
            vect(1)=labReceive(1);
            vect(2)=labReceive(2);
            vect(3)=labReceive(3);
             disp(vect);
         
    end 
            
end     