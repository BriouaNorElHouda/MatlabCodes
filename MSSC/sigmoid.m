
function activation = sigmoid(z)
    activation = 1 ./ (1 + exp(-z));
end
