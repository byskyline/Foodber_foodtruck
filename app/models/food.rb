class Food < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :food_truck

  has_attached_file :picture, styles: { large: "500x500>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
   validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
