json.array!(@foods) do |food|
  json.id                  food.id
  json.food_truck_id       food.food_truck_id
  json.name                food.name
  json.price               food.price
  json.picture_thumb       food.picture(:thumb)
  json.picture_medium      food.picture(:medium)
  json.picture_large       food.picture(:large)
  json.url                 food_truck_food_url(food.food_truck_id,food.id, format: :json)
end