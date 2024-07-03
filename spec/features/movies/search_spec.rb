require 'rails_helper'

RSpec.describe 'movie search' do
  describe 'happy path' do
    it 'allows a user to search for a movie by name', :vcr do
      user1 = User.create(name: 'Noah', email: 'ndurbin@gmail.com')

      visit "users/#{user1.id}/discover"

      fill_in :search, with: 'batman'

      click_button 'Search'

      expect(page.status_code).to eq 200
    end
  end
end
