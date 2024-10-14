function r = prim(n)

c = 0;

for i=1 : n-1
  if ( isprime(i))
   c = c+1;
   r = c;
  end
end