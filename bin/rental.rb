class Rental
  attr_accessor :movie, :days_rented

  def initialize(movie: movie, days_rented: days_rented)
    @movie = movie
    @days_rented = days_rented
  end
end