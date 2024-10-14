function encodedText = hideText(originalText, hiddenMessage)
    % Ensure the hidden message is not longer than the original text
    if length(hiddenMessage) > length(originalText)
        error('Hidden message is too long');
    end

    % Initialize the encoded text with the original text
    encodedText = originalText;

    % Define the index where the hidden message will start
    startIndex = randi([1, length(originalText) - length(hiddenMessage) + 1]);

    % Insert the hidden message into the original text
    encodedText(startIndex:startIndex + length(hiddenMessage) - 1) = hiddenMessage;
end
