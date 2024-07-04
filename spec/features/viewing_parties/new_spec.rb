require 'rails_helper'

RSpec.describe 'viewing party new page' do
  before :each do
    @user = User.create(name: 'Noah', email: 'ndurbin@gmail.com')
    @movie = Movie.new(
       {
         "adult": false,
         "backdrop_path": "/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg",
         "genre_ids": [
           18,
           80
         ],
         "id": 278,
         "original_language": "en",
         "original_title": "The Shawshank Redemption",
         "overview": "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
         "popularity": 120.189,
         "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
         "release_date": "1994-09-23",
         "title": "The Shawshank Redemption",
         "video": false,
         "vote_average": 8.705,
         "vote_count": 26399
       },
    )
  end
  it 'can create a new viewing party' do
    VCR.use_cassette("/movie_show_page/displays_a_movies_information/shows_a_movies_title_and_other_details") do
      visit "/users/#{@user.id}/movies/#{@movie.id}"

      click_button "Create New Viewing Party"

      expect(page).to have_content(@movie.title)
      fill_in 'When', with: Date.tomorrow.strftime('%Y-%m-%d')
      fill_in 'Start Time', with: '07:00'

      click_button "Create Party"

      expect(page).to have_content('Party Created Successfully')
    end
  end
end
