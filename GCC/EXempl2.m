clc;
a=3;
b=4;
spmd
 c=labindex();
 d=c+a;
end
e=a+d{1};
c{2}=5;
spmd
 f=c*b
end
