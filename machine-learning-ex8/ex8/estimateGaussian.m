function [mu sigma2] = estimateGaussian(X)
%ESTIMATEGAUSSIAN This function estimates the parameters of a 
%Gaussian distribution using the data in X
%   [mu sigma2] = estimateGaussian(X), 
%   The input X is the dataset with each n-dimensional data point in one row
%   The output is an n-dimensional vector mu, the mean of the data set
%   and the variances sigma^2, an n x 1 vector
% 

% Useful variables
[m, n] = size(X);

% You should return these values correctly
mu = zeros(n, 1);
sigma2 = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the mean of the data and the variances
%               In particular, mu(i) should contain the mean of
%               the data for the i-th feature and sigma2(i)
%               should contain variance of the i-th feature.
%

mu=(mean(X));
mu=mu';
% var in octave calculates 1/(m-1) SUM_i (x(i) - mean(x))^2 but we need 1/(m) SUM_i (x(i) - mean(x))^2
% so we van devide the result by 1/(m-1) and than deviding it by m to have variance based on m not m-1.

%sigma2=var(X)*(m-1)*(1/m);
%sigma2=sigma2';
% OR use vectorized implementation
Xmu=X-mu';
sigma2=diag((Xmu'*Xmu)/m); 







% =============================================================


end
