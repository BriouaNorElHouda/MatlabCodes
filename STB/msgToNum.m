function num = msgToNum(message)
    % Convertir le message en un nombre
    num = uint64(0);
    for i = 1:length(message)
        num = num * 256 + uint64(message(i));
    end
end
