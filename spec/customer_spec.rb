require 'spec_helper'
require_relative '../bin/customer'

RSpec.describe Customer do

  it 'can initialize with a customer name' do
    customer = Customer.new(customer_name: "Robert")
    expect(customer.customer_name).to eq("Robert")
    end
end