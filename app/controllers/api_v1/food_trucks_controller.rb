class ApiV1::FoodTrucksController < ApiController

 # GET /api/v1/food_trucks/:id
  def show
    @food_trucks = FoodTruck.find(params[:id])

    # show.json.jbuilder
  end

  # GET /api/v1/food_trucks
  def index
    @food_trucks = FoodTruck.page( params[:page] )
      respond_to do |format|
        format.html
        format.json
      end
    # index.json.jbuilder
  end

end
