class AddGetOrderToFoodTrucks < ActiveRecord::Migration
  def change
  	add_column :food_trucks, :get_order, :string
  end
end
