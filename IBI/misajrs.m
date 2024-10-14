function [ws, bias] = misajrs(X, Y, ws, bias, tauappr)
    m = length(Y);
    Y_pred = sigmoid(X * ws + bias);
    
  
    W = (1/m) * X' * (Y_pred - Y);
    B = (1/m) * sum(Y_pred - Y);
    
    ws = ws - tauappr * W;
    bias = bias - tauappr * B;
end
