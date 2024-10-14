for i=1:35
 tic;
 r=fib(i);
 temps(i)=toc;

end
plot(temps);
