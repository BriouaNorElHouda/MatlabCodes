function bitab = btab(n)
   
    bistr = dec2bin(n, 8);
   
    bitab = zeros(1, 8);
    for i = 1:length(bistr)
        bitab(i) = str2double(bistr(i));
    end
end
