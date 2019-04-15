require 'rest-client'
require 'json'

def get_pokemon_data(id)
  data = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{id}")
  data_hash = JSON.parse(data)
end

def get_description(id)
  data = RestClient.get("https://pokeapi.co/api/v2/pokemon-species/#{id}")
  data_hash = JSON.parse(data)
  data_hash["flavor_text_entries"].each do |entry|
    if entry["language"]["name"] == "en"
      return entry["flavor_text"]
    end
  end
end

def seed_wild_pokemon_table
  151.times do |i|
    index = i + 1
    pokemon = get_pokemon_data(index)
    name = pokemon["name"]
    height = pokemon["height"]
    weight = pokemon["weight"]
    image = pokemon["sprites"]["front_default"]
    description = get_description(index)

    WildPokemon.create(
      pokedex_index: index,
      name: name,
      height: height,
      weight: weight,
      img: image,
      description: description
    )
  end
end
