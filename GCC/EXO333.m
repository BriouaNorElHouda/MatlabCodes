n = 100;
spmd % simple spmd block
a = rand(n,n);
display(size(a))
display(a(1:2,1:2))
end