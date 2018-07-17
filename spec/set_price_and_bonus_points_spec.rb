require 'spec_helper'
require_relative '../interactors/set_price_and_bonus_points'
require_relative '../bin/rental'
require_relative '../bin/movie'
require_relative '../bin/customer'

RSpec.describe Interactors::SetPriceAndBonusPoints do
  let(:new_movie)       {Movie.new(title_for_movie: "Jaws", price_code: Movie::NEW_RELEASE) }
  let(:kids_movie)      {Movie.new(title_for_movie: "Incredibles 2", price_code: Movie::CHILDRENS_MOVIE)}
  let(:regular_movie)   {Movie.new(title_for_movie: "Avengers", price_code: Movie::REGULAR)}
  let(:new_rental)      {Rental.new(movie: new_movie, days_rented: 2)}
  let(:kids_rental)     {Rental.new(movie: kids_movie, days_rented: 4)}
  let(:regular_rental)  {Rental.new(movie: regular_movie, days_rented: 2)}
  let(:customer)        {Customer.new(customer_name: "Robert")}

  describe 'calculates and prints out a statement' do
    it 'can calculate a price and bonus points awarded for a new release movie rented for 2 days' do
      expect(Interactors::SetPriceAndBonusPoints.call([new_rental], customer)).to eq "Rental record for Robert\nAmount owed is $6\nYou earned 2 frequent renter points"
    end

    it 'can calculate a price and bonus points awarded for a kids movie rented for 4 days' do
      expect(Interactors::SetPriceAndBonusPoints.call([kids_rental], customer)).to eq "Rental record for Robert\nAmount owed is $3.0\nYou earned 1 frequent renter points"
    end

    it 'can calculate a price and bonus points awarded for a regular movie rented for 2 days' do
      expect(Interactors::SetPriceAndBonusPoints.call([regular_rental], customer)).to eq "Rental record for Robert\nAmount owed is $2\nYou earned 1 frequent renter points"
    end
  end
end