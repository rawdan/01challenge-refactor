require 'spec_helper'
require_relative '../bin/rental'

RSpec.describe Rental do
  it 'can instantiate a new rental object with a movie' do
    movie = Movie.new(title_for_movie: "Jaws")
    rental = Rental.new(movie: movie.title_for_movie)
    expect(rental.movie[:movie][:title_for_movie]).to eq("Jaws")
  end
end

