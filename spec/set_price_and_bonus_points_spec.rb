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

    it 'returns 0 amount and 0 bonus points if no movie is rented' do
      expect(Interactors::SetPriceAndBonusPoints.call([], customer)).to eq "Rental record for Robert\nAmount owed is $0\nYou earned 0 frequent renter points"
    end

    it 'can calculate a price and bonus points awarded for a new release movie rented for 2 days' do
      expect(Interactors::SetPriceAndBonusPoints.call([new_rental], customer)).to eq "Rental record for Robert\nAmount owed is $6\nYou earned 2 frequent renter points"
    end

    it 'can calculate a price and bonus points awarded for a kids movie rented for 4 days' do
      expect(Interactors::SetPriceAndBonusPoints.call([kids_rental], customer)).to eq "Rental record for Robert\nAmount owed is $1.5\nYou earned 1 frequent renter points"
    end

    it 'can calculate a price and bonus points awarded for a kids movie rented for 2 days, and it should cost just as much as for 4 days' do
      new_kids_rental = Rental.new(movie: kids_movie, days_rented: 1)
      expect(Interactors::SetPriceAndBonusPoints.call([new_kids_rental], customer)).to eq "Rental record for Robert\nAmount owed is $1.5\nYou earned 1 frequent renter points"
    end

    it 'can calculate a price and bonus points awarded for a regular movie rented for 2 days' do
      expect(Interactors::SetPriceAndBonusPoints.call([regular_rental], customer)).to eq "Rental record for Robert\nAmount owed is $2\nYou earned 1 frequent renter points"
    end

    it 'can calculate multiple rental bonus points and a prices added up' do
      expect(Interactors::SetPriceAndBonusPoints.call([new_rental, kids_rental, regular_rental], customer)).to eq "Rental record for Robert\nAmount owed is $9.5\nYou earned 4 frequent renter points"
    end
  end
end

# We have code comments
# Now for those of you that are new to my blog
# or are simply curious as to why I am so opposed to comments
# the reason is twofold and boils down to this:
#
# The existence of code comments is proof of hard to understand code
# and hard to understand code logic.
# If you need to add comments to your code
# to make it readable, chances are you need to refactor more
#
# And secondly, I have yet to meet a developer that once tasked with
# making changes to commented code will take the time to
# improve and change the comments so that they now reflect the new
# code reality. So what happens is that by the time the third developer
# come up to the code, the comments say one story because they are outdated
# and the code tells a whole other story
