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
  end

  def top_rated
    response = conn.get('/3/movie/top_rated')

    data = JSON.parse(response.body, symbolize_names: true)

    data[:results].first(20)
  end

  def movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?append_to_response=credits,reviews")

    data = JSON.parse(response.body, symbolize_names: true)

    @movie = Movie.new(data)
  end

  def get_usa_providers(movie_id)
    response = conn.get("/3/movie/#{movie_id}/watch/providers")

    data = JSON.parse(response.body, symbolize_names: true)

    data[:results][:US]
  end
end
