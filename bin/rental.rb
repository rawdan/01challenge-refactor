class Rental
  attr_accessor :movie, :days_rented

  def initialize(movie, days_rented = nil)
    @movie = movie
    @days_rented = days_rented
  end
end