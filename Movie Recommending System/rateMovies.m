function ratings = rateMovies (movieList)
% Get the ratings from an user
  ratings = zeros(size(movieList, 1), 1);%  Initialize ratings
  movie_id = 1;
  while movie_id > 0  
    movie_id = input("\nWhat movie do you want to rate?(0 ends rating for this user) ");
    if movie_id <= length(movieList) && movie_id > 0
      rateprompt = sprintf("How do you rate movie %s(0 or >5 means no rating)? ", movieList{movie_id});
      rate = input(rateprompt);
      if rate > 0 && rate <= 5
        ratings(movie_id) = rate;
      end  
    elseif movie_id > length(movieList)
      fprintf("Movie ID bigger than %d, choose another!\n\n", length(movieList));
    else
      break;
    end
  end
end