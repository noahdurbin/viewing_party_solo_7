class MovieFacade
  def search(keyword)
    service = MovieService.new
    service.search(keyword)
  end

  def top_rated
    service = MovieService.new
    service.top_rated
  end
end
