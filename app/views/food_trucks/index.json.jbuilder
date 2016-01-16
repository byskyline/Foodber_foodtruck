json.array!(@food_trucks) do |food_truck|
  json.extract! food_truck, :id, :name, :longitude, :latitude ,:picture
  json.foods food_truck.foods
  json.url food_truck_url(food_truck, format: :json)
end
