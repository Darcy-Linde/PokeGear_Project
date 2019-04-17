Rails.application.routes.draw do
  resources :trainers
  resources :owned_pokemons, only: [:edit, :update, :delete]
  resources :wild_pokemons, only: [:index, :show]
  resources :battles, only: [:show]
  resources :gyms, only: [:index, :show]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
