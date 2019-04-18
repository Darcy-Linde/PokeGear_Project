class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.string :trainer_id
      t.string :gym_id
      t.integer :answer_count
      t.boolean :victory

      t.timestamps
    end
  end
end
