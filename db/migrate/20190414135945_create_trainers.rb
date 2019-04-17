class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name
      t.text :bio
      t.string :password_digest
      t.string :profile_img
      t.integer :num_badges
      
      t.timestamps
    end
  end
end
