require 'rails_helper'

RSpec.describe 'top movie discovery' do
  describe 'happy path' do
    it 'allows a user to discover the top rated movies' do
      user1 = User.create(name: "Noah", email: "ndurbin@gmail.com")

      visit user_discover_movie_path(user1)

      expect(page).to have_button("Top Rated Movies")

      click_button 'Top Rated Movies'

      expect(current_path).to eq()
    end
  end
end