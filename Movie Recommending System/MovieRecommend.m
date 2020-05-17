movieList = createRatingsDatabase('movies.csv', 'ratings.csv');
my_ratings = rateMovies(movieList);
fprintf('\nNew user ratings:\n');
for i = 1:length(my_ratings)
  if my_ratings(i) > 0 
      fprintf('Rated %d for %s\n', my_ratings(i), movieList{i});
  end
end
fprintf('\nProgram paused. Press ENTER to get your recommended movies.\n');  pause;

fprintf('\nTraining collaborative filtering...\n');
load('ratings.mat');
addNewUserRatings (Y, R, my_ratings)
[X, Theta, Ynorm, Ymean] = trainCollaborativeFiltering (Y, R);
p = X * Theta';
predictions = p(:,1) + Ymean;
[r, ix] = sort(predictions, 'descend');
num_recommendations = 0;
while num_recommendations <= 0 || num_recommendations > length(movieList)
  num_recommendations = input("\nHow many movie recommendations do you want? ");
  if num_recommendations <= 0
    fprintf("Cannot have a negative number of recommendations!\n");
  elseif num_recommendations > length(movieList)
    fprintf("Cannot have a number of recommendations bigger than %d!\n", length(movieList));
  end
end
fprintf('\nTop %d recommendations for you:\n', num_recommendations);
for i=1:num_recommendations
  fprintf('Predicting rating %.1f for movie %s\n', predictions(ix(i)), movieList{ix(i)});
end