class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :money
      t.text :bio
      t.integer :party_id
      t.integer :inventory_id

      t.timestamps
    end
  end
end
