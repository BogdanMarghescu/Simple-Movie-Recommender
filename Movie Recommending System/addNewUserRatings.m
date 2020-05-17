function addNewUserRatings (Y, R, new_ratings)
  Y = [new_ratings Y]; %  Add our own ratings to the data matrix
  R = [(new_ratings ~= 0) R];
end