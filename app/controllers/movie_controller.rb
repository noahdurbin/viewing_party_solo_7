class MovieController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  # def top_rated; end

  def search
    keyword = params[:search]
    @user = User.find(params[:user_id])

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:api_key] = Rails.application.credentials.tmdb[:apikey]
    end

    response = conn.get("/3/search/movie?query=#{keyword}&language=en-US&page=1")

    data = JSON.parse(response.body, symbolize_names: true)

    @movies = data[:results]
  end
end
