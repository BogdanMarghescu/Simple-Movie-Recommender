function movieList = createRatingsDatabase (movies_csv, ratings_csv)
% Creates movie database based on two CSV files  
  pkg load io;
  movies_cell = csv2cell(movies_csv);
  ratings_cell = csv2cell(ratings_csv);
  movies = movies_cell([2:end], 1:2);
  ratings = cell2mat(ratings_cell([2:end], 1:3));
  movieList = movies(:, 2);
  movie_ids = cell2mat(movies(:, 1));
  for i=1:length(movie_ids)
    ratings(find(ratings(:, 2) == movie_ids(i)), 2) = i;
    movies{i, 1} = i;
  end
  clear movie_ids;
  Y = zeros(max(ratings(:, 2)), max(ratings(:, 1)));
  for i=1:size(ratings, 1)
    Y(ratings(i, 2), ratings(i, 1)) = ratings(i, 3);
  end
  R = (Y > 0);
  save ratings.mat Y R;
end