class CreateOwnedPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :wild_pokemon_id
      t.integer :trainer_id
      t.string :nick_name

      t.timestamps
    end
  end
end
