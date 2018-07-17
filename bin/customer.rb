class Customer
  attr_accessor :customer_name

  def initialize(customer_name: customer_name)
    @customer_name = customer_name
  end
end