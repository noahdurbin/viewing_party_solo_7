require 'rails_helper'

RSpec.describe Movie do
  it 'can create a new movie object from hash data' do
    test_data = {
      title: 'Interstellar',
      id: 12,
      vote_average: 10.0
    }

    movie = Movie.new(test_data)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('Interstellar')
    expect(movie.score).to eq(10.0)
  end
end
