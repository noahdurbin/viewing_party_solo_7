class MovieFacade
  def initialize(service = MovieService.new)
    @service = service
  end

  def search(keyword)
    response = @service.search(keyword)
    create_movies(response)
  end

  def top_rated
    response = @service.top_rated
    create_movies(response)
  end

  def movie_details(movie_id)
    @service.movie_details(movie_id)
  end

  def create_movies(movie_array)
    movie_array.map do |movie|
      Movie.new(movie)
    end
  end
end
