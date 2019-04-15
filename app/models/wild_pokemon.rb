class WildPokemon < ApplicationRecord
  has_many :owned_pokemons
  has_many :trainers through: :owned_pokemons
end
