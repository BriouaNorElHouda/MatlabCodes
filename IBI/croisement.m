v=randi([0, 1],1,5)
v2=randi([0, 1],1,5)
t=zeros(1,5);
n= 5;
Pc = 0.7;
pc = randi(n);
if rand<pc
  for  i = 1:pc
    t(i)=v(i);
    v(i)=v2(i);
    v2(i)=t(i);
   
end
for i=pc:length(v)
    t(i)=v(i);
    v(i)=v2(i);
    v2(i)=t(i);
end


    
end
disp('v')
disp(v);
disp('v2')
disp(v2);