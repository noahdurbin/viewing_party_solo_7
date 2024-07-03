require 'rails_helper'

RSpec.describe 'movie search' do
  describe 'happy path' do
    it 'allows a user to search for a movie by name', :vcr do
      visit 

      fill_in :search, with: 'Batman'

      click_button 'Search'

      expect(page.status_code).to eq 200
      ex
    end
  end
end