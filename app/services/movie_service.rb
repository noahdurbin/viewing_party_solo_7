class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers[api - key] = Rails.application.credentials.TMDB[:key]
    end
  end

  def search(keyword)
    conn.get("/3/search/movie?#{keyword}&language=en-US&page=1")
  end
end
