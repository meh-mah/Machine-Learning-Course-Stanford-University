function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%lambada should be addedd only to theta 1 and so on. It is not necessary to add lambada to theta 0

hypothesis =sigmoid(X*theta);

J=(1/m)*sum((-1*y).*log(hypothesis )- (1-y).*log(1-hypothesis )) + ((lambda/(2*m))*sum((theta(2:end, :)).^2));
err=hypothesis -y;
grad=(X'*err)/m;
grad=[grad(1) ; grad(2:end, :)+(lambda/m).*theta(2:end, :)];





% =============================================================

end
