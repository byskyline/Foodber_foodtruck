json.data do

json.array!(@food_trucks) do |food_truck|

  json.id                      food_truck.id
  json.name                    food_truck.name
  json.longitude               food_truck.longitude
  json.latitude                food_truck.latitude
  json.picture_medium          food_truck.picture(:medium)
  json.picture_thumb           food_truck.picture(:thumb)
  json.url                     food_truck_url(food_truck, format: :json)

  json.foods do
    json.array!(food_truck.foods) do |food|
      json.id                  food.id
      json.food_truck_id       food.food_truck_id
      json.name                food.name
      json.price               food.price
      json.picture_thumb       food.picture(:thumb)
      json.picture_medium      food.picture(:medium)
      json.picture_large       food.picture(:large)
    end
  end
end

end