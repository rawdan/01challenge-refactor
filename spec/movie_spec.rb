require 'spec_helper'
require_relative '../bin/movie'

RSpec.describe Movie do
  it 'can instantiate a new movie with title' do
    movie = Movie.new(title_for_movie: "My Movie", price_code: 2)
    expect(movie.title_for_movie).to eq("My Movie")
    expect(movie.price_code).to eq(2)
  end
end