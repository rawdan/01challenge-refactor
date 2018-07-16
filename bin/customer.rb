require_relative '../bin/rental'
require_relative '../bin/movie'

class Customer
  attr_accessor :customer_name

  def initialize(customer_name: customer_name)
    @customer_name = customer_name
    @rentals ||= []
  end

end