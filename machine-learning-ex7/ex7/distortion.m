## Copyright (C) 2016 Mehran

## Author: Mehran <Mehran@Mahboobeh-HP>
## Created: 2016-07-28

function cost = distortion (X, centroids, idx)
% Since K-means is subject to local minimum, one way to choose between  different solutions
%from different random initializationsof centroid is to choose the one 
%with the lowest cost function value (distortion).
[m n]=size(X);
centroids_map=centroids(idx, :);
distances=X - centroids_map;


%only values in diagnol of matrix is the distance (dis=(x1-x2)^2 + (y1-y2)^2)
% another way is sum(distance .^2, 1). but i tride to be smart and implement vectorized version for performance

%distances=(distances * distances') .*eye(m, m);

%trace gives diagonal sum of a matrix. WE no that distances are stored diagonaly
%cost=1/m *(trace(distances));

%or
distances=sum(distances .^2, 1);
cost=1/m *(sum(distances));

endfunction
