require_relative 'api_data.rb'

Trainer.delete_all
Gym.delete_all
OwnedPokemon.delete_all
Battle.delete_all
WildPokemon.delete_all

seed_wild_pokemon_table

trainer = Trainer.create(name: "Darcy", bio: "Young trainer looking for adventure!")
trainer_poke = OwnedPokemon.create(wild_pokemon_id: WildPokemon.first.id, trainer_id: trainer.id, nick_name: "Vine Whip and Nae Nae")
brock = Gym.create(name: "Pewter City Gym", leader_name: "Brock", number_of_questions: 2)
first_gym_battle = Battle.create(trainer_id: trainer.id, gym_id: brock.id, victory: true)
