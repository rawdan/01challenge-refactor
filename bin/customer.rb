require_relative '../bin/rental'
require_relative '../bin/movie'
require_relative '../interactors/set_price_and_bonus_points'

class Customer
  attr_accessor :customer_name

  def initialize(customer_name: customer_name)
    @customer_name = customer_name
  end
end