function train_neural_network(X_train, Y_train, t_appr, epochs)
    E_size = size(X_train, 2);
    S_size = 1;

    w = randn(E_size, S_size);
    bias = 1;

    for epoch = 1:epochs
        for i = 1:length(X_train)
            E = X_train(i, :);
            S_d = Y_train(i);

            [S, d_S] = forward_propagation(E, w, bias);
            [err, d_err] = calculerr(S, S_d);
            [w, bias] = backward_propagation(E, S, d_S, S_d, t_appr);
        end

        fprintf('Epoch %d, erreur: %.4f\n', epoch, err);
    end
end
