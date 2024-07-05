require 'rails_helper'

RSpec.describe Movie do
  describe 'Initialize' do
    it 'can create a new movie object from search hash data' do
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

    it 'can create a movie object from the full movie details' do
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

      movie = Movie.new(test_data)

      expect(movie.id).to eq(123)
      expect(movie.title).to eq("Test Movie")
      expect(movie.score).to eq(8.5)
      expect(movie.genres).to eq(["Action", "Drama"])
      expect(movie.runtime).to eq("2h 30m")
      expect(movie.runtimemin).to eq(150)
      expect(movie.summary).to eq("A great movie about testing")
      expect(movie.tagline).to eq("Test all the things")
    end
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
