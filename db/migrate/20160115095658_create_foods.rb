class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :price
      t.integer :food_truck_id

      t.timestamps null: false
    end

    add_index :foods, :food_truck_id
  end
end
