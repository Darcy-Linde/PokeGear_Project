class OwnedPokemon < ApplicationRecord
  belongs_to :trainer
  belongs_to :wild_pokemon
end
