Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'welcome#index'
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: %i[show create] do
    get '/discover', to: 'movies#discover'
    get '/top_rated', to: 'movies#top'
    get '/movies', to: 'movies#index'
    get '/movies/:movie_id', to: 'movies#show'
  end
end
