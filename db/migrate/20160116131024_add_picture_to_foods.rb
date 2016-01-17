class AddPictureToFoods < ActiveRecord::Migration
  def change
    add_attachment :foods, :picture
  end
end
