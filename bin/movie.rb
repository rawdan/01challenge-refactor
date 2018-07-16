class Movie
  CHILDRENS_MOVIE = 2
  REGULAR = 0
  NEW_RELEASE = 1

  attr_reader :title_for_movie
  attr_accessor :price_code

  def initialize(title_for_movie: title_for_movie, price_code: price_code)
    @title_for_movie = title_for_movie
    @price_code = price_code
  end

  def test_initializer
    puts @title_for_movie
    puts @price_code
  end
end

m = Movie.new(title_for_movie: "My Title", price_code: "2")

m.test_initializer