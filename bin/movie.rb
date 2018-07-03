class Movie
  CHILDRENS_MOVIE = 2
  REGULAR = 0
  NEW_RELEASE = 1

  attr_accessor :price_code, :title_for_movie

  def initialize(title_for_movie, price_code = nil)
    @title_for_movie = title_for_movie
    @price_code = price_code
  end

end

movie = Movie.new(title_for_movie:'Jaws')
puts movie.title_for_movie