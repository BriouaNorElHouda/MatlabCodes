
function s= mutation(v,pm)

random=rand();
 
disp('the position is');
p = randi([1,length(v)])
    if random < pm
     
        if v(p)==1
         v(p)=0;
        else
          v(p)=1;
        end
    
    end
    disp(v);
end

