function [x, v, mp] = init(Nbpop, F, S, B, L)
    x = rand(Nbpop, 4);
    x(:, 1) = x(:, 1) * (F(2) - F(1)) + F(1);
    x(:, 2) = x(:, 2) * (S(2) - S(1)) + S(1);
    x(:, 3) = x(:, 3) * (B(2) - B(1)) + B(1);
    x(:, 4) = x(:, 4) * (L(2) - L(1)) + L(1);

    v = rand(Nbpop, 4);
    mp = x;
end
