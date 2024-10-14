
function new_tab = apply_rules(tab)
for i = 1:49
    tab(i)= 0;
end

tab(26) = 1;
    new_tab = zeros(1, length(tab));
    for i = 1:length(tab)
        if i == 1
            new_tab(i) = tab(i+1);
        elseif i == length(tab)
            new_tab(i) = tab(i-1);
        else
            left = tab(i-1);
            center = tab(i);
            right = tab(i+1);
            if left == 1 && center == 1 && right == 1
                new_tab(i) = 0;
            elseif left == 1 && center == 1 && right == 0
                new_tab(i) = 0;
            elseif left == 1 && center == 0 && right == 1
                new_tab(i) = 0;
            elseif left == 1 && center == 0 && right == 0
                new_tab(i) = 1;
            elseif left == 0 && center == 1 && right == 1
                new_tab(i) = 1;
            elseif left == 0 && center == 1 && right == 0
                new_tab(i) = 1;
            elseif left == 0 && center == 0 && right == 1
                new_tab(i) = 1;
            elseif left == 0 && center == 0 && right == 0
                new_tab(i) = 0;
            end
        end
    end
   





for i = 1:50
    imagesc(new_tab)
   new_tab = apply_rules(tab);
    
end


end


