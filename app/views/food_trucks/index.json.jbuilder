json.array!(@food_trucks) do |food_truck|
  json.extract! food_truck, :id, :name, :longitude, :latitude ,:picture
  json.id         food_truck.id
  json.name       food_truck.name
  json.picture_medium   food_truck.picture(:medium)
  json.picture_thumb   food_truck.picture(:thumb)

  json.food       food_truck.foods
  json.url        food_truck_url(food_truck, format: :json)
end



