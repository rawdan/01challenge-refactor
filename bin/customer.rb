require_relative '../bin/rental'
require_relative '../bin/movie'
class Customer
  attr_accessor :customer_name

  def initialize(customer_name)
    @customer_name = customer_name
    @rentals ||= []
  end

  def add_rental_object_to_list(arg)
    x = 7
    @rentals << arg
  end

  def statement
    total_amount = 0
    frequent_renter_points =  0
    result = "Rental Record for #{@customer_name}\n"
    @rentals.each do |_element|
      this_amount = 0

      # determine amounts for each line
  case _element.movie.price_code
  when Movie::REGULAR
    this_amount += 2
    this_amount += (_element.days_rented - 2) * 1.5 if _element.days_rented > 2
  when Movie::NEW_RELEASE
    this_amount += _element.days_rented * 3
  when Movie::CHILDRENS_MOVIE
    this_amount += 1.5
    this_amount += (_element.days_rented - 3) * 1.5 if _element.days_rented > 3
  end

      # add frequent renter points
      frequent_renter_points += 1
      # add bonus for a two day new release rental
      frequent_renter_points += 1 if _element.movie.price_code == Movie.NEW_RELEASE && _element.days_rented > 1

      # show figures for this rental
      result += "\t" + _element.movie.title_for_movie + "\t" + this_amount.to_s + "\n"
    total_amount += this_amount
    end
    # add footer lines
    result += "Amount owed is #{total_amount.to_s}\n"
    result += "You earned #{frequent_renter_points.to_s} frequent renter points"
    result
  end
end

# puts "Helo there!"
#
# movie = Movie.new(title_for_movie: 'Jaws' )
# rental = Rental.new(movie: "Jaws")
# customer = Customer.new(customer_name: "Bob")
# puts customer.statement



