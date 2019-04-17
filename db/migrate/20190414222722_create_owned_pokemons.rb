class CreateOwnedPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :owned_pokemons do |t|
      t.integer :wild_pokemon_id
      t.integer :trainer_id
      t.boolean :catch

      t.timestamps
    end
  end
end
