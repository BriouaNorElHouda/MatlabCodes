function [enf1, enf2] = Coss_bin(v1, v2, Pc)
    
    enf1 = v1;
    enf2 = v2;
    
    if rand < Pc
        cp = randi(length(v1) - 1);
        enf1(cp+1:end) = v2(cp+1:end);
        enf2(cp+1:end) = v1(cp+1:end);
    end
end
