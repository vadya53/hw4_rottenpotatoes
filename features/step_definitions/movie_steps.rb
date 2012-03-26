Given /^the following movies exist:$/ do |movies_table|
  movies_table.hashes.each do |movie|
    @movie = Movie.new
    @movie.title = movie["title"]
    @movie.rating = movie["rating"]
    @movie.director = movie["director"]
    @movie.release_date = movie["release_date"]
    @movie.save
  end
  #assert false, "Unimplmemented"
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  movie = Movie.find_by_title(title)
  assert movie.director == director, "Director of '#{title}' is #{movie.director}, not #{director} as expected!"
end
