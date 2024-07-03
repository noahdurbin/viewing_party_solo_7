Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: [:show, :create] do
    get '/discover', to: 'movies#discover', as: 'discover_movie_path'
    get '/search', to: 'movies#search', as: 'search_movie_path'
    get '/top_rated', to: 'movies#top', as: 'top_rated_path'
  end
end
