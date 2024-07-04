class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    facade = MovieFacade.new
    @user = User.find(params[:user_id])

    if params[:search].nil?
      @movies = facade.top_rated
    else
      keyword = params[:search]
      @movies = facade.search(keyword)
    end
  end

  def show
    facade = MovieFacade.new
    @user = User.find(params[:user_id])
    @movie = facade.movie_details(params[:movie_id])
  end
end
