class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.string :name
      t.string :gym_img
      t.string :badge_name
      t.string :badge_img
      t.string :leader_name
      t.string :leader_img
      t.integer :number_of_questions

      t.timestamps
    end
  end
end
