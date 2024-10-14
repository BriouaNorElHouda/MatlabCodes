function GB = fitnes(x)
    GB = ((x(:, 1).^2 + x(:, 2).^2 + x(:, 3).^2 + x(:, 4).^2) ./ ...
        (cos(x(:, 1)) .* cos(x(:, 2)) .* cos(x(:, 3)) .* cos(x(:, 4))));
end
