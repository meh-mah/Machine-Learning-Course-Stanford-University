function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
parfor i=1:size(X, 1)
mindis=inf;
  for j=1:K
  %find distance between point xi and all centroid
  %than select the index of closest centroid
  distance=X(i,:) - centroids(j,:);
  %only values in diagnol of matrix is the distance (dis=(x1-x2)^2 + (y1-y2)^2)
  % another way is sum(distance .^2, 1). but i tride to be smart and implement vectorized version for performance
  distance= distance * distance';
  if (distance<= mindis)
  mindis=distance;
  idx(i)=j;
  endif
  endfor
endparfor






% =============================================================

end

