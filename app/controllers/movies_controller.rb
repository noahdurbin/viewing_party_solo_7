class MovieController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def top_rated; end

  def search
    keyword = params[:search]
    @user = User.find(params[:id])
    service = MovieService.new

    response = service.search(keyword)

    data = JSON.parse(response.body, symbolize_names: true)

    movies = data[:results].first(20)

    movies.each do |movie|
      Movie.new(movie)
    end
  end
end
