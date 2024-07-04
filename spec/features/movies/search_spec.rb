require 'rails_helper'

RSpec.describe 'movie search' do
  describe 'happy path' do
    it 'allows a user to search for a movie by name', :vcr do
      user1 = User.create(name: 'Noah', email: 'ndurbin@gmail.com')

      visit "users/#{user1.id}/discover"

      fill_in :search, with: 'batman'

      click_button 'Search'

      expect(page).to have_content('Batman')
    end

    it 'returns a list of 20 movies', :vcr do
      user1 = User.create(name: 'Noah', email: 'ndurbin@gmail.com')

      visit "users/#{user1.id}/discover"

      fill_in :search, with: 'batman'

      click_button 'Search'

      expect(page).to have_css('.movie', count: 20)
    end
  end
end
