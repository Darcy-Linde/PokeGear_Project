class CreateWildPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :wild_pokemons do |t|
      t.integer :pokedex_index
      t.string :img
      t.string :name
      t.integer :height
      t.integer :weight
      t.text :description

      t.timestamps
    end
  end
end
