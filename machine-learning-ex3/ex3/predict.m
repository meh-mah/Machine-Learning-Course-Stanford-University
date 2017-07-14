function pos = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
pos = zeros(size(X, 1), 1);
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

%input layer * theta1=hidden layer or g(z)=1/1+e^z where z= X * theta'
a2=sigmoid(X*Theta1');
%add bias to hiden layer
a2 = [ones(m, 1) a2];
%hidden layer * theta2=output layer
a3=sigmoid(a2*Theta2');
%evaluate each row to find max out put a3 which correspond to a highest probability of being in a specific category.
%for example if highst value is at position 5 so it is highly proble that the image is 5
[z ,pos]=max(a3, [],2);






% =========================================================================


end
