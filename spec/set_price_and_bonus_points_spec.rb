require 'spec_helper'
require_relative '../interactors/set_price_and_bonus_points'
require_relative '../bin/rental'
require_relative '../bin/movie'
require_relative '../bin/customer'

RSpec.describe Interactors::SetPriceAndBonusPoints do
  let(:movie)    {Movie.new(title_for_movie: "Jaws", price_code: Movie::NEW_RELEASE) }
  let(:movie2)   {Movie.new(title_for_movie: "Incredibles 2", price_code: Movie::CHILDRENS_MOVIE)}
  let(:movie3)   {Movie.new(title_for_movie: "Avengers", price_code: Movie::REGULAR)}
  let(:rental)   {Rental.new(movie: movie, days_rented: 2)}
  let(:rental2)  {Rental.new(movie: movie2, days_rented: 2)}
  let(:rental3)  {Rental.new(movie: movie3, days_rented: 3)}
  let(:customer) {Customer.new(customer_name: "Robert")}

  describe 'calculates and prints out a statement' do
    it 'can calculate a price and bonus points awarded based on type of movie and number of days rented' do
      expect(Interactors::SetPriceAndBonusPoints.call(rental, customer)).to eq "Rental record for Robert\nAmount owed is $6\nYou earned 2 frequent renter points"
    end
  end
end