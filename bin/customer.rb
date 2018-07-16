require_relative '../bin/rental'
require_relative '../bin/movie'

class Customer
  attr_accessor :customer_name

  def initialize(customer_name: customer_name)
    @customer_name = customer_name
    @rentals ||= []
  end

  def add_rental_object_to_list(arg)
    # x = 7
    @rentals << arg
  end

  def statement
    total_amount = 0
    frequent_renter_points = 0
    result = "Rental Record for #{@customer_name}\n"
    frequent_renter_points, result, total_amount = set_ammount_and_bonus_points(frequent_renter_points, result, total_amount)
    # add footer lines
    result += "Amount owed is #{total_amount.to_s}\n"
    result += "You earned #{frequent_renter_points.to_s} frequent renter points"
    result
  end

  private

  def set_ammount_and_bonus_points(frequent_renter_points, result, total_amount)
    @rentals.each do |rented_movie|
      this_amount = 0

      # determine amounts for each line
      case rented_movie.movie.price_code
      when Movie::REGULAR
        this_amount += 2; this_amount += (rented_movie.days_rented - 2) * 1.5 if rented_movie.days_rented > 2
      when Movie::NEW_RELEASE
        this_amount += rented_movie.days_rented * 3
      when Movie::CHILDRENS_MOVIE
        this_amount += 1.5; this_amount += (rented_movie.days_rented - 3) * 1.5 if rented_movie.days_rented > 3
      end

      # add frequent renter points
      frequent_renter_points += 1
      # add bonus for a two day new release rental
      frequent_renter_points += 1 if rented_movie.movie.price_code == Movie::NEW_RELEASE && rented_movie.days_rented > 1

      # show figures for this rental
      result += "\t" + rented_movie.movie.title_for_movie + "\t" + this_amount.to_s + "\n"
      total_amount += this_amount
    end
    return frequent_renter_points, result, total_amount
  end
end

m = Movie.new(title_for_movie: "Jaws", price_code: Movie::NEW_RELEASE)
r = Rental.new(movie: m, days_rented: 2)
c = Customer.new(customer_name: "Robert")
c.add_rental_object_to_list(r)
puts c.statement
