function r = fib(n)


if (n==1 ||n==0)
    r = 1;
elseif ( n>=2)
r = fib(n-1) + fib(n-2);

end