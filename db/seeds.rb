Trainer.delete_all
Gym.delete_all
OwnedPokemon.delete_all
Battle.delete_all
WildPokemon.delete_all

trainer = Trainer.create(name: "Darcy", bio: "Young trainer looking for adventure!")
bulbasaur = WildPokemon.create(pokedex_index: 1, name: "Bulbasaur", height: 4, weight: 10, description: "Green plant thingy")
trainer_poke = OwnedPokemon.create(wild_pokemon_id: bulbasaur.id, trainer_id: trainer.id, nick_name: "Vine Whip and Nae Nae")
brock = Gym.create(name: "Pewter City Gym", leader_name: "Brock", number_of_questions: 2)
first_gym_battle = Battle.create(trainer_id: trainer.id, gym_id: brock.id, victory: true)
