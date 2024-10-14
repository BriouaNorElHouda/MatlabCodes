%programme 2
clc
N=10;
spmd
    switch labindex 
        case 1
            a=25*N;
            labBroadcast(1,a);
            x=labReceive(2);
            y=labReceive(3);
           z= labReceive(4);
           disp(x); disp(y); disp(z);
           b=labReceive(4);
        case 2
            data= labBroadcast(1);
            b=data/2;
            labSend(b,1);
        case 3
            data= labBroadcast(1);
            b=data+N;
            labSend(b,1);
        case 4
            data= labBroadcast(1);
            b=data/10;
            labSend(b,1);
             labSend(b*N,1);
    end
    
end
b{4}=N+b{4};
b{1}=12;
spmd 
    b=b*5;
end

disp(b{1});disp(b{2});disp(b{3});disp(b{4});

