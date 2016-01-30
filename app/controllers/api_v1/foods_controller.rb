class ApiV1::FoodsController < ApiController

 # GET /api/v1/foods/:id
  def show
    @foods = Food.find(params[:id])
  end

  # GET /api/v1/foods
  def index
    @foods = Food.page( params[:page] )
  end

end
