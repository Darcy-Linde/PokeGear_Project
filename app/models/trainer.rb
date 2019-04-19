class Trainer < ApplicationRecord
  has_many :owned_pokemons
  has_many :wild_pokemons, through: :owned_pokemons
  has_many :battles
  has_many :gyms, through: :battles

  validates :name, uniqueness: true
  
  has_secure_password

  def my_pokemon
    pokemon = OwnedPokemon.where(trainer_id: self.id).uniq
    pokemon.sort_by! {|pokemon| pokemon.wild_pokemon_id}
    wild_pokemon = []
    pokemon.each do |pokemon|
      wild_pokemon << WildPokemon.find(pokemon.wild_pokemon_id)
    end
    wild_pokemon
  end
end
