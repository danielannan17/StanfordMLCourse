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

% Method using nested loops
% for i = 1:length(X) 
%   idx(i) = 1;
%   dis = norm(X(i,:)-centroids(1,:));
%   for j = 2:K
%      norm(X(i,:)-centroids(j,:));
%      if norm(X(i,:)-centroids(j,:)) < dis
%        dis = norm(X(i,:)-centroids(j,:));
%        idx(i) = j;
%      endif
%  endfor
% endfor

%Method with only 1 loop
Xtrans = X';
for i = 1:length(Xtrans)
  % Duplicate example vector to form an n x K matrix
  x = repmat(Xtrans(:,i), size(K,2),K);
  % Subtract a different centroid from each copy of X
  x -= centroids';
  % Calculate norms and choose closest centroid
  [val, index] = min(vecnorm(x));
  idx(i,1) = index;
endfor  

% =============================================================

end

