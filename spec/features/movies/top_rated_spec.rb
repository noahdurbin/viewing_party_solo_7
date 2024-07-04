require 'rails_helper'

RSpec.describe 'top movie discovery' do
  describe 'happy path' do
    it 'allows a user to discover the top rated movies', :vcr do
      user1 = User.create(name: 'Noah', email: 'ndurbin@gmail.com')

      visit "users/#{user1.id}/discover"

      expect(page).to have_button('Top Rated Movies')

      click_button 'Top Rated Movies'

      expect(page)
    end
  end
end
