
function s= mutation(v);

v=randi([0, 1],1,5)
for  i = 1:length(v)
    
    if v(i)==1
        v(i)=0;
    else
    v(i)=1;
    end
    
end
disp(v);