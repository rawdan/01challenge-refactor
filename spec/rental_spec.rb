require 'spec_helper'
require_relative '../bin/rental'

RSpec.describe Rental do
  it 'can instantiate a new rental object with a movie' do
    rental = Rental.new(movie: 'Jaws')
    expect(rental.movie).to eq(:movie => "Jaws")
  end
end

