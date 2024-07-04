require 'rails_helper'

RSpec.describe MovieService do
  it 'should return a response body parsed from JSON when given a search parameter', :vcr do
    response = MovieService.new.search('Interstellar')

    expect(response).to be_a Array
    expect(response).to all(be_a Movie)
    expect(response.first.title).to eq('Interstellar')
  end
end
