% programme principal
clc;
tic;
a1=serie(50,10000);
t1=toc;
tic;
a2=parallel(50,10000);
t2=toc;
disp(['Serial Processing time :',num2str(t1)]);
disp(['Parallel Processing time :',num2str(t2)]);