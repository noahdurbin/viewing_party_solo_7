Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'welcome#index'
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: %i[show create] do
    get '/discover', to: 'movie#discover', as: 'discover_movie_path'
    post '/search', to: 'movie#search', as: 'search_movie_path'
    get '/top_rated', to: 'movie#top', as: 'top_rated_path'
    get '/movies', to: 'movie#index', as: 'movie_results_path'
  end
end
