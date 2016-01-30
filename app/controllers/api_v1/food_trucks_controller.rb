class ApiV1::FoodTrucksController < ApiController

 # GET /api/v1/food_trucks/:id
  def show
    @food_trucks = FoodTruck.find(params[:id])
  end

  # GET /api/v1/food_trucks
  def index
    @food_trucks = FoodTruck.page( params[:page] )
  end

end
