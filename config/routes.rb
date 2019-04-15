Rails.application.routes.draw do
  resources :trainers
  resources :owned_pokemons, only: [:edit, :update, :delete, :destroy]
  resources :wild_pokemons, only: [:index, :show]
  resources :battles, only: [:show]
  resources :gyms, only: [:index, :show]
end
