%parpool(4);
v=randi(10,1,20)
spmd
switch labindex
case 1
m=min(v);
 labSend(m,4);
case 2
s=sum(v);
 labSend(s,4);
case 3
p=prod(v);
 labSend(p,4 );
case 4
disp(labReceive(1));
disp( labReceive(2));
disp(labReceive(3));
 end
end
%matlabpool close