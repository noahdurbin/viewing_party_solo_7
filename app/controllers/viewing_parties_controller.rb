class ViewingPartiesController < ApplicationController
  def new
    binding.pry
    @movie = Movie.find(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    ViewingParty.new()
  end

  private

  def viewing_party_params

  end
end
