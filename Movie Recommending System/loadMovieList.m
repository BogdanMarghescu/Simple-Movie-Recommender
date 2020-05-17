function movieList = loadMovieList(movielist_filename)
%GETMOVIELIST reads the fixed movie list in movie.txt and returns a
%cell array of the words
%   movieList = GETMOVIELIST() reads the fixed movie list in movie.txt 
%   and returns a cell array of the words in movieList.
  fid = fopen(movielist_filename);%% Read the fixed movieulary list
  n = 1682;  % Total number of movies 
  movieList = cell(n, 1);% Store all movies in cell array movie{}
  for i = 1:n
    line = fgets(fid);  % Read line
    [idx, movieName] = strtok(line, ' '); % Word Index (can ignore since it will be = i)
    movieList{i} = strtrim(movieName);  % Actual Word
  end
  fclose(fid);
end