class AddPictureToFoodTrucks < ActiveRecord::Migration
  def change
    add_attachment :food_trucks, :picture
  end
end
