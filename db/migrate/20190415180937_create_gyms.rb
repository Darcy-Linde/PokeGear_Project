class CreateGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :gyms do |t|
      t.integer :index
      t.string :name
      t.string :badge_name
      t.string :badge_img
      t.string :leader_name
      t.string :leader_img
      t.text :before_quote
      t.text :after_quote
      t.integer :number_of_questions

      t.timestamps
    end
  end
end
