require 'rails_helper'

RSpec.describe Movie do
  it 'can create a new movie object from hash data' do
    test_data = {
      title: 'Interstellar',
      id: 12,
      vote_average: 10.0
    }

    movie = Movie.new(test_data)

    expect(movie).to be_a(Movie)
    expect(movie.title).to eq('Interstellar')
    expect(movie.score).to eq(10.0)
  end

  describe 'methods' do
    before :each do
      test_data = {
        id: 123,
        title: "Test Movie",
        vote_average: 8.5,
        genres: [{ name: "Action" }, { name: "Drama" }],
        runtime: 150,
        overview: "A great movie about testing",
        tagline: "Test all the things",
        credits: {
          cast: [
            { id: 1, name: "Actor 1", character: "Character 1" },
            { id: 2, name: "Actor 2", character: "Character 2" }
          ]
        },
        reviews: {
          results: [
            { author: "Reviewer 1", content: "Great movie!" },
            { author: "Reviewer 2", content: "Loved it!" }
          ]
        }
      }

      @movie = Movie.new(test_data)
    end
    describe 'set_genres' do
      it 'returns an empty array if genres are nil' do
        expect(@movie.set_genres(nil)).to eq([])
      end

      it 'returns an array of genre names' do
        genres = [{ name: "Comedy" }, { name: "Action" }]
        expect(@movie.set_genres(genres)).to eq(["Comedy", "Action"])
      end
    end

    describe 'set_runtime' do
      it 'returns nil if runtime is nil' do
        expect(@movie.set_runtime(nil)).to be_nil
      end

      it 'converts minutes to hours and minutes' do
        expect(@movie.set_runtime(90)).to eq("1h 30m")
      end
    end

    describe 'set_top_cast' do
      it 'returns an empty array if credits are nil' do
        expect(@movie.set_top_cast(nil)).to eq([])
      end

      it 'returns the top 10 cast members' do
        expect(@movie.top_cast.length).to eq(2)
        expect(@movie.top_cast.first).to be_a(Movie::CastMember)
        expect(@movie.top_cast.first.name).to eq("Actor 1")
      end
    end

    describe 'set_reviews' do
      it 'returns an empty array if reviews are nil' do
        expect(@movie.set_reviews(nil)).to eq([])
      end

      it 'returns an array of Review objects' do
        expect(@movie.reviews.length).to eq(2)
        expect(@movie.reviews.first).to be_a(Movie::Review)
        expect(@movie.reviews.first.author).to eq("Reviewer 1")
      end
    end
  end
end


# require 'rails_helper'

# RSpec.describe 'movie show page' do
#   describe 'displays a movies information' do
#     before :each do
#       @user = User.create(name: 'Noah', email: 'ndurbin@gmail.com')
#       @movie = Movie.new(
#         id: 123,
#         title: "Example Movie",
#         vote_average: 8.5,
#         genres: [{id: 28, name: "Action"}, {id: 12, name: "Adventure"}],
#         runtime: 142,
#         overview: "This is a summary of the movie.",
#         tagline: "An exciting tagline!",
#         cast: [
#           {id: 1, name: "Actor 1", character: "Character 1"},
#           {id: 2, name: "Actor 2", character: "Character 2"},
#         ],
#         reviews: {
#           page: 1,
#           results: [
#             {author: "Reviewer 1", content: "Great movie!"},
#             {author: "Reviewer 2", content: "I loved it."},
#           ]
#         }
#       )
#     end
#     it 'shows a movies title and other details' do
#       visit "/users/#{@user.id}/movies/#{@movie.id}"

#       expect(page).to have_content("Example Movie")
#       expect(page).to have_content("2h 22m")
#       expect(page).to have_content("This is a summary of the movie.")
#       expect(page).to have_content("An exciting tagline!")
#       expect(page).to have_content("Great movie")
#       expect(page).to have_content("Actor 1")
#     end

#     it 'contains a link to return to the discover page' do
#       expect(page).to have_link("Return to Discover Movies", href: "users/#{@user.id}/discover")
#     end

#     it 'contains a link to create a viewing party' do
#       expect(page).to have_link("Create Viewing Party")
#     end
#   end
# end
