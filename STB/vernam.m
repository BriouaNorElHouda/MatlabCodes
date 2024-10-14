function  ciphertxt=vernam(message,key)

%lmessage=lenght(message);
%lkey=lenght(key);

nummsg = msgToNum(message);
numkey = msgToNum(key);
binmsg = dec2bin(nummsg)
binkey = dec2bin(numkey)

c = zeros(1, 23);
for i=1:23
    
    if binmsg(i)== binkey(i)
        c(i)=0;
    else
        c(i)=1;
        
    end
    
end
 %disp (c);
 decypher = bi2de(c, 'left-msb')

 cypher = char(decypher)
 

end
