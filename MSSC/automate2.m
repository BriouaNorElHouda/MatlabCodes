
for i = 1:49
    tab(i)= 0;
end
tab(26) = 1;
%les relgele 30, 54 ,90, 94, 110 et 220.
tr=btab(90);
Automate=tab;
    new_tab = zeros(1, length(tab));

    for t=1:50
    for i = 1:length(tab)
        if i == 1
            new_tab(i) = tab(i+1);
        elseif i == length(tab)
            new_tab(i) = tab(i-1);
        else
            g = tab(i-1);
            c = tab(i);
            d = tab(i+1);
            if g == 1 && c == 1 && d == 1
                new_tab(i) = tr(1);
            elseif g == 1 && c == 1 && d == 0
                new_tab(i) = tr(2);
            elseif g == 1 && c == 0 && d == 1
                new_tab(i) =tr(3);
            elseif g == 1 && c == 0 && d == 0
                new_tab(i) = tr(4);
            elseif g == 0 && c == 1 && d == 1
                new_tab(i) = tr(5);
            elseif g == 0 && c == 1 && d == 0
                new_tab(i) = tr(6);
            elseif g == 0 && c == 0 && d == 1
                new_tab(i) = tr(7);
            elseif g == 0 && c == 0 && d == 0
                new_tab(i) = tr(8);
            end
        end
       
    end
   
tab=new_tab;

Automate=[Automate;tab];
imagesc(Automate);
 colormap([1 1 1; 0.4940 0.1840 0.5560])
    end




