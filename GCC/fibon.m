function out = fibon(n)
if n <2
    out=1;
else 
out = fibon(n-1) + fibon(n-2);
end