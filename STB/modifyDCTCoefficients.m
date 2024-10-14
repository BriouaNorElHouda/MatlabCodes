function modifiedCoefficients = modifyDCTCoefficients(coefficients, indices, binaryMessage)
    modifiedCoefficients = coefficients;
    for i = 1:length(indices)
        [row, col] = indices(i, :);
        modifiedCoefficients(row, col) = bitset(modifiedCoefficients(row, col), 1, binaryMessage(i)=='1');
    end
end