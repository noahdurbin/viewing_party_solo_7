class ViewingPartiesController < ApplicationController
  def new
    @movie = MovieFacade.new.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all.excluding(@user)
  end

  def create
    new_party = ViewingParty.new(duration: params[:duration], date: params[:when], start_time: params[:start_time], movie_id: params[:movie_id])
    if new_party.save
      UserParty.create!(viewing_party: new_party, user_id: params[:user_id], host: true)
      if params[:invite]
        params[:invite].each do |user_id|
          UserParty.create!(viewing_party: new_party, user_id: user_id, host: false)
        end
      end
      flash[:alert] = "Party Created Successfully"
      redirect_to "/users/#{params[:user_id]}"
    else
      flash[:error] = new_party.errors
      redirect_to "/users/#{params[:user_id]}/movies/#{params[:movie_id]}/viewing_party/new"
    end
  end
end
