function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;


% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
Cvec=[0.01 0.03 0.1 0.3 1 3 10 30];
Sigmavec=[0.01 0.03 0.1 0.3 1 3 10 30];

predictions_error_train = zeros(size(Cvec, 2), size(Sigmavec, 2));
predictions_error_val = zeros(size(Cvec, 2), size(Sigmavec, 2));

temp_min=inf;
temp_dif_tr_val=inf;
parfor i=1:size(Cvec, 2)
  parfor j=1:size(Sigmavec, 2)
  
  model= svmTrain(X, y, Cvec(i), @(x1, x2) gaussianKernel(x1, x2, Sigmavec(j)));
  
  predictions_train = svmPredict(model, X);
  predictions_val = svmPredict(model, Xval);
  
  predictions_error_train(i, j) = mean(double(predictions_train ~= y));
  predictions_error_val (i, j)= mean(double(predictions_val ~= yval));
  
  %select lowest error on val set 
  if (predictions_error_val (i, j) <= temp_min  )
  temp_min=predictions_error_val (i, j);
  temp_dif_tr_val=abs(predictions_error_train (i, j) - predictions_error_val (i, j) );
  predictions_error_train (i, j);
  predictions_error_val (i, j);
  index=[i j];
  endif
  
  endparfor
endparfor
figure(3);
ert=predictions_error_train';
ert=ert(:);
plot( 1:64 , ert, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 7)
hold on
erv=predictions_error_val';
erv=erv(:);
plot( 1:64 , erv, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7)
hold off;

C=Cvec(index(1))
sigma=Sigmavec(index(2))




% =========================================================================

end
