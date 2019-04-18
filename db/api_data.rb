require 'rest-client'
require 'json'

def get_pokemon_data(id)
  data = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{id}")
  JSON.parse(data)
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

def seed_wild_pokemons_table
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

def seed_gyms_table(hash)
  hash.each do |key, value|
    Gym.create(
      index: value[:index],
      name: value[:name],
      badge_name: value[:badge_name],
      badge_img: value[:badge_img],
      leader_name: value[:leader_name],
      leader_img: value[:leader_img],
      before_quote: value[:before_quote],
      after_quote: value[:after_quote],
      number_of_questions: value[:number_of_questions]
    )
  end
end

def get_easy_trivia
  data = RestClient.get("https://opentdb.com/api.php?amount=25&category=18&difficulty=easy&type=multiple")
  data_hash = JSON.parse(data)
  data_array = data_hash["results"]
end

def get_medium_trivia
  data = RestClient.get("https://opentdb.com/api.php?amount=25&category=18&difficulty=medium&type=multiple")
  data_hash = JSON.parse(data)
  data_array = data_hash["results"]
end

def get_hard_trivia
  data = RestClient.get("https://opentdb.com/api.php?amount=15&category=18&difficulty=hard&type=multiple")
  data_hash = JSON.parse(data)
  data_array = data_hash["results"]
end

def create_trivia(array_of_hashes)
  array_of_hashes.each do |hash|
  Trivium.create(
    difficulty: hash["difficulty"],
    question: hash["question"],
    correct_answer: hash["correct_answer"],
    incorrect_answer_1: hash["incorrect_answers"][0],
    incorrect_answer_2: hash["incorrect_answers"][1],
    incorrect_answer_3: hash["incorrect_answers"][2]
  )
  end
end

def seed_trivia_table
  create_trivia(get_easy_trivia)
  create_trivia(get_medium_trivia)
  create_trivia(get_hard_trivia)
end
