function [x, v, mp, mpg] = miseajour(x, v, mp, F, S, B, L, omega, C1, C2)
    GB = fitnes(x);

    mp(GB < ((mp(:, 1).^2 + mp(:, 2).^2 + mp(:, 3).^2 + mp(:, 4).^2) ./ ...
        (cos(mp(:, 1)) .* cos(mp(:, 2)) .* cos(mp(:, 3)) .* cos(mp(:, 4)))), :) = x(GB < ((mp(:, 1).^2 + mp(:, 2).^2 + mp(:, 3).^2 + mp(:, 4).^2) ./ ...
        (cos(mp(:, 1)) .* cos(mp(:, 2)) .* cos(mp(:, 3)) .* cos(mp(:, 4)))), :);

    [mv, im] = min(GB);
    mpg = x(im, :);

    v = omega * v + C1 * rand(size(v)) .* (mp - x) + C2 * rand(size(v)) .* (repmat(mpg, size(v, 1), 1) - x);
    x = x + v;

    x = max(x, repmat([F(1), S(1), B(1), L(1)], size(x, 1), 1));
    x = min(x, repmat([F(2), S(2), B(2), L(2)], size(x, 1), 1));
end
