function ciphertxt = vigenerecipher(message,key)

lmessage=lenght(message);
lkey=lenght(key);

ciphertxt='';
for i=1:lmessage
   
     alpatoencr = message(i);
        if isletter(alpatoencr)
            if isstrprop(alpatoencr, 'lower')
                shift =mod(key(mod(i-1,lkey) + 1) - 'A',26);

            else
                cipherchar = mod(message(i) + shift -'A',26) +'A';
            end
        else
            cipherchar = alpatoencr; % Leave non-letter characters unchanged
        end
        ciphertxt = [ciphertxt, char(cipherchar)];
    end
end



end
