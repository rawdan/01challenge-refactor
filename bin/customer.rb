require_relative '../bin/rental'
require_relative '../bin/movie'
require_relative '../interactors/set_price_and_bonus_points'

class Customer
  attr_accessor :customer_name

  def initialize(customer_name: customer_name)
    @customer_name = customer_name
    @rentals ||= []
  end

end

m = Movie.new(title_for_movie: "Jaws", price_code: Movie::NEW_RELEASE)
m2 = Movie.new(title_for_movie: "Incredibles 2", price_code: Movie::CHILDRENS_MOVIE)
m3 = Movie.new(title_for_movie: "Avengers", price_code: Movie::REGULAR)
r = Rental.new(movie: m, days_rented: 2)
r2 = Rental.new(movie:m2, days_rented: 2)
r3 = Rental.new(movie:m3, days_rented: 2)
c = Customer.new(customer_name: "Robert")
puts Interactors::SetPriceAndBonusPoints.call(r3,c)