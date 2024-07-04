class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params['api_key'] = Rails.application.credentials.tmdb[:apikey]
    end
  end

  def search(keyword)
    response = conn.get("/3/search/movie?query=#{keyword}&language=en-US&page=1")

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results].first(20)

    movies.map do |movie|
      Movie.new(movie)
    end
  end

  def top_rated
    response = conn.get('/3/movie/top_rated')

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results].first(20)

    movies.map do |movie|
      Movie.new(movie)
    end
  end

  def movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?append_to_response=credits,reviews")

    data = JSON.parse(response.body, symbolize_names: true)
  end
end
