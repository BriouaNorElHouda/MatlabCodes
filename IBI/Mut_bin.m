
function vm = Mut_bin(vect, Pm)
    vm = vect; 
    
    for i = 1:length(vect)
        if rand < Pm
           
            if vect(i) == 0
                vm(i) = 1;
            else
                vm(i) = 0;
            end
        end
    end
end
