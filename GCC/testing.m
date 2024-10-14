function accuracy = testing(X_test,Y_test,Y_pred,ws,bias)


Y_pred = round(sigmoid(X_test * ws + bias));
%accuracy = (number of correct predictions) / (total number of predictions)
accuracy = (sum(Y_pred) / length(Y_test)) * 100;

disp(['Accuracy du r�seau de neurones : ' num2str(accuracy) '%']);
end