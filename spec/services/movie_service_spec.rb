require 'rails_helper'

RSpec.describe MovieService do
  it 'should return a response body parsed from JSON when given a search parameter', :vcr do
    response = MovieService.new.search('Interstellar')

    expect(response).to be_a Array
    expect(response).to all(be_a Movie)
    expect(response.first.title).to eq('Interstellar')
  end

  it 'should return a list of 20 movies', :vcr do
    response = MovieService.new.top_rated

    expect(response).to be_a Array
    expect(response).to all(be_a Movie)
    expect(response.length).to eq 20
    expect(response.first.title).to eq("The Shawshank Redemption")
  end

  it 'should be able to retrieve a moviews details', :vcr do
    response = MovieService.new.movie_details(278)

    expect(response).to be_a Movie
    expect(response.title).to eq("The Shawshank Redemption")
    expect(response.score).to eq(8.705)
    expect(response.top_cast.length).to eq(10)
  end
end
