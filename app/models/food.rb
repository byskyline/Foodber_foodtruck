class Food < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :food_truck
end
