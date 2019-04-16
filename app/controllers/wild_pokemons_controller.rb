class WildPokemonsController < ApplicationController
  def index
    @wild_pokemons = WildPokemon.all
  end

  def show
    @wild_pokemon = WildPokemon.find(params[:id])
  end

end
