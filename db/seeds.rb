require_relative 'api_data.rb'

Trainer.delete_all
Gym.delete_all
OwnedPokemon.delete_all
Battle.delete_all
WildPokemon.delete_all

gyms_hash = {
  gym_1: {
    name: "Pewter City Gym",
    badge_name: "Boulder Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/d/dd/Boulder_Badge.png/50px-Boulder_Badge.png",
    leader_name: "Brock",
    leader_img: "https://cdn.bulbagarden.net/upload/3/30/Spr_HGSS_Brock.png",
    before_quote: "I'm Brock! I'm Pewter's Gym Leader! I believe in rock hard defense and determination! That's why my Pokémon are all the Rock-type! Do you still want to challenge me? Fine then! Show me your best!",
    after_quote: "I took you for granted. As proof of your victory, here's the Boulder Badge!",
    number_of_questions: 2
  },
  gym_2: {
    name: "Cerulean City Gym",
    badge_name: "Cascade Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/9/9c/Cascade_Badge.png/50px-Cascade_Badge.png",
    leader_name: "Misty",
    leader_img: "https://cdn.bulbagarden.net/upload/d/d1/Spr_HGSS_Misty.png",
    before_quote: "Hi, you're a new face! Trainers who want to turn pro have to have a policy about Pokémon! What is your approach when you catch Pokémon? My policy is an all-out offensive with Water-type Pokémon!",
    after_quote: "Wow! You're too much! All right! You can have the Cascade Badge to show you beat me!",
    number_of_questions: 2
  },
  gym_3: {
    name: "Vermilion City Gym",
    badge_name: "Thunder Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/a/a6/Thunder_Badge.png/50px-Thunder_Badge.png",
    leader_name: "Lt. Surge",
    leader_img: "https://cdn.bulbagarden.net/upload/1/1d/Spr_HGSS_Lt_Surge.png",
    before_quote: "Hey, kid! What do you think you're doing here? You won't live long in combat! That's for sure! I tell you kid, electric Pokémon saved me during the war! They zapped my enemies into paralysis! The same as I'll do to you!",
    after_quote: "Whoa! You're the real deal, kid! Fine then, take the ThunderBadge!",
    number_of_questions: 3
  },
  gym_4: {
    name: "Celadon City Gym",
    badge_name: "Rainbow Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/b/b5/Rainbow_Badge.png/50px-Rainbow_Badge.png",
    leader_name: "Erika",
    leader_img: "https://cdn.bulbagarden.net/upload/c/c7/Spr_HGSS_Erika.png",
    before_quote: "Hello. Lovely weather isn't it? It's so pleasant. ...Oh dear... I must have dozed off. Welcome. My name is Erika. I am the Leader of Celadon Gym. I teach the art of flower arranging. My Pokémon are of the grass-type. Oh, I'm sorry, I had no idea that you wished to challenge me. Very well, but I shall not lose.",
    after_quote: "Oh! I concede defeat. You are remarkably strong. I must confer you the Rainbow Badge.",
    number_of_questions: 3
  },
  gym_5: {
    name: "Fuchsia City Gym",
    badge_name: "Soul Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/7/7d/Soul_Badge.png/50px-Soul_Badge.png",
    leader_name: "Koga",
    leader_img: "https://cdn.bulbagarden.net/upload/1/18/Spr_HGSS_Koga.png",
    before_quote: "Fwahahaha! A mere child like you dares to challenge me? Very well, I shall show you true terror as a ninja master! You shall feel the despair of poison and sleep techniques!",
    after_quote: "Humph! You have proven your worth! Here! take the SoulBadge!",
    number_of_questions: 4
  },
  gym_6: {
    name: "Saffron City Gym",
    badge_name: "Marsh Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/6/6b/Marsh_Badge.png/50px-Marsh_Badge.png",
    leader_name: "Sabrina",
    leader_img: "https://cdn.bulbagarden.net/upload/d/dc/Spr_HGSS_Sabrina.png",
    before_quote: "I had a vision of your arrival! I have had psychic powers since I was a little child. I first learned to bend spoons with my mind. I dislike fighting, but if you wish, I will show you my powers!",
    after_quote: "I'm shocked! But a loss is a loss. I admit I didn't work hard enough to win! You earned the MarshBadge!",
    number_of_questions: 4
  },
  gym_7: {
    name: "Cinnabar Island Gym",
    badge_name: "Volcano Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/1/12/Volcano_Badge.png/50px-Volcano_Badge.png",
    leader_name: "Blaine",
    leader_img: "https://cdn.bulbagarden.net/upload/7/78/Spr_HGSS_Blaine.png",
    before_quote: "Hah! I'm Blaine! I am the Leader of Cinnabar Gym! My fiery Pokémon will incinerate all challengers! Hah! You better have Burn Heal!",
    after_quote: "I've burnt out! You have earned the Volcano Badge!",
    number_of_questions: 4
  },
  gym_8: {
    name: "Viridian City Gym",
    badge_name: "Earth Badge",
    badge_img: "https://cdn.bulbagarden.net/upload/thumb/7/78/Earth_Badge.png/50px-Earth_Badge.png",
    leader_name: "Giovanni",
    leader_img: "https://cdn.bulbagarden.net/upload/3/3c/Spr_HGSS_Giovanni.png",
    before_quote: "Fwahahaha! This is my hideout! I planned to resurrect Team Rocket here! But, you have caught me again! So be it! This time, I'm not holding back! Once more, you shall face Giovanni, the greatest trainer!",
    after_quote: "Ha! That was a truly intense fight! You have won! As proof, here is the Earth Badge!",
    number_of_questions: 5
  }
}

seed_gyms_table(gyms_hash)
seed_wild_pokemons_table


trainer = Trainer.create(name: "Darcy", bio: "Young trainer looking for adventure!")
trainer_poke = OwnedPokemon.create(wild_pokemon_id: WildPokemon.first.id, trainer_id: trainer.id, nick_name: "Vine Whip and Nae Nae")
gym = Gym.first
first_gym_battle = Battle.create(trainer_id: trainer.id, gym_id: gym.id, victory: true)
