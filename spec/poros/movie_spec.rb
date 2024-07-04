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
