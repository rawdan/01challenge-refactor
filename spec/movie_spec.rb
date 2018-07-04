require 'spec_helper'
require_relative '../bin/movie'

RSpec.describe Movie do
  it 'can instantiate a new movie with title' do
    movie = Movie.new(title_for_movie: 'Jaws')
    expect(movie.title_for_movie[:title_for_movie]).to eq("Jaws")
  end
end