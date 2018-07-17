require_relative '../bin/rental'
require_relative '../bin/movie'
require_relative '../interactors/set_price_and_bonus_points'

class Customer
  attr_accessor :customer_name

  def initialize(customer_name: customer_name)
    @customer_name = customer_name
  end
end

new_movie =       Movie.new(title_for_movie: "Jaws", price_code: Movie::NEW_RELEASE)
kids_movie =      Movie.new(title_for_movie: "Incredibles 2", price_code: Movie::CHILDRENS_MOVIE)
regular_movie =   Movie.new(title_for_movie: "Avengers", price_code: Movie::REGULAR)
new_rental =      Rental.new(movie: new_movie, days_rented: 3)
kids_rental =     Rental.new(movie: kids_movie, days_rented: 3)
regular_rental =  Rental.new(movie: regular_movie, days_rented: 3)
customer =        Customer.new(customer_name: "Robert")

puts Interactors::SetPriceAndBonusPoints.call([new_rental, kids_rental, regular_rental], customer)