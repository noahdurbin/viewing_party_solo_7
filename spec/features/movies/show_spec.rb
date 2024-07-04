require 'rails_helper'

RSpec.describe 'movie show page' do
  describe 'displays a movies information' do
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
    it 'shows a movies title and other details', :vcr do
      visit "/users/#{@user.id}/movies/#{@movie.id}"

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("2h 22m")
      expect(page).to have_content("Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
      expect(page).to have_content("Fear can hold you prisoner. Hope can set you free.")
      expect(page).to have_content("very good movie 9.5/10 محمد الشعراوى")
      expect(page).to have_content("Tim Robbins as Andy Dufresne")
      expect(page).to have_content("Morgan Freeman as Ellis Boyd 'Red' Redding")
    end

    it 'contains a link to return to the discover page' do
      VCR.use_cassette("/movie_show_page/displays_a_movies_information/shows_a_movies_title_and_other_details") do
        visit "/users/#{@user.id}/movies/#{@movie.id}"

        expect(page).to have_link("Return to Discover Movies")
      end
    end

    it 'contains a link to create a viewing party' do
      VCR.use_cassette("/movie_show_page/displays_a_movies_information/shows_a_movies_title_and_other_details") do
        visit "/users/#{@user.id}/movies/#{@movie.id}"

        expect(page).to have_link("Create Viewing Party")
      end
    end
  end
end
