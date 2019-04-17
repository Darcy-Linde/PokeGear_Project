class Trainer < ApplicationRecord
  has_many :owned_pokemons
  has_many :wild_pokemons, through: :owned_pokemons
  has_many :battles
  has_many :gyms, through: :battles

  has_secure_password
end
