function test_neural_network(X_test, Y_test, w, bias)
    correct_predictions = 0;

    for i = 1:length(X_test)
        E = X_test(i, :);
       S_d = Y_test(i);

        S = forward_propagation(E, w, bias);S

        % Arrondir la sortie à 1 ou 2
        predicted_class = round(S);

        if predicted_class == S_d
            correct_predictions = correct_predictions + 1;
        end
    end

    accuracy = correct_predictions / length(X_test) * 100;
    fprintf('Accuracy on Test Set: %.2f%%\n', accuracy);
end
