class OwnedPokemonsController < ApplicationController

  def index
    @owned_pokemons = Trainer.find(current_user.id).my_pokemon
  end

  def new
    @pokemon = OwnedPokemon.new
    first_id = WildPokemon.first.id
    @wild_pokemon = WildPokemon.find(rand(first_id..(first_id + 150)))
  end

  def create
    @trainer_id = current_user.id
    if params["owned_pokemon"][:nick_name] == "Yes"
      OwnedPokemon.create(wild_pokemon_id: params["owned_pokemon"][:wild_pokemon_id], trainer_id: @trainer_id)
      redirect_to wild_pokemon_path(params["owned_pokemon"][:wild_pokemon_id])
    else
      redirect_to trainer_path(@trainer_id)
    end
  end

end
