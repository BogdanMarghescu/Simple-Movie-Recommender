function [X, Theta, Ynorm, Ymean] = trainCollaborativeFiltering (Y, R)
  [Ynorm, Ymean] = normalizeRatings(Y, R);  %  Normalize Ratings
  num_users = size(Y, 2);
  num_movies = size(Y, 1);
  num_features = 10;
  X = randn(num_movies, num_features);  % Set Initial Parameters (Theta, X)
  Theta = randn(num_users, num_features);
  initial_parameters = [X(:); Theta(:)];
  options = optimset('GradObj', 'on', 'MaxIter', 100);
  lambda = 10;  % Set Regularization
  theta = fmincg (@(t)(cofiCostFunc(t, Ynorm, R, num_users, num_movies, num_features, lambda)), initial_parameters, options);
  X = reshape(theta(1 : num_movies * num_features), num_movies, num_features);% Unfold the returned theta back into U and W
  Theta = reshape(theta(num_movies * num_features + 1 : end), num_users, num_features);
end