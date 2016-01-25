class AddOwnerToFoodTrucks < ActiveRecord::Migration
  def change
  	add_column :food_trucks, :email, :string
  end
end
