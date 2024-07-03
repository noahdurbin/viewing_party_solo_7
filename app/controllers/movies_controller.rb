class MovieController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def top_rated
  end

  def search

  end
end
