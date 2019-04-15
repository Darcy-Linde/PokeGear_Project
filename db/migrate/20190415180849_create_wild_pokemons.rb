class CreateWildPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :wild_pokemons do |t|

      t.timestamps
    end
  end
end
