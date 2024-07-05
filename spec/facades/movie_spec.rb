require 'rails_helper'

RSpec.describe MovieFacade do
  it 'can retrieve the top rated movies' do
    VCR.use_cassette('/top_movie_discovery/happy_path/allows_a_user_to_discover_the_top_rated_movies') do
      facade = MovieFacade.new
      response = facade.top_rated

      expect(facade).to be_a MovieFacade
      expect(response).to be_a Array
      expect(response).to be_all Movie
    end
  end

  it 'can search for a movie with a keyword' do
    VCR.use_cassette('/movieservice/should_return_a_response_body_parsed_from_JSON_when_given_a_search_parameter') do
      facade = MovieFacade.new
      response = facade.search('Interstellar')

      expect(response).to be_a Array
      expect(response).to be_all Movie
    end
  end

  it 'can retrieve a movies details with its id', :vcr do
    facade = MovieFacade.new
    response = facade.movie_details(278)

    expect(response).to be_a Movie
    expect(response.title).to eq("The Shawshank Redemption")
  end
end
