class FoodTrucksFoodsController < ApplicationController

  before_action :set_food_truck
  def index
    @foods = @food_truck.foods
  end

  def show
    @food = @food_truck.foods.find(params[:id])
  end

  def new
    @food = @food_truck.foods.build
  end

  def create
    @food = @food_truck.foods.build(food_params)

    if @food.save
      redirect_to food_truck_foods_url(@food_truck)
    else
      render :action => "new"
    end
  end

  def destroy
    @food = @food_truck.foods.find(params[:id])

    @food.destroy

    redirect_to food_truck_foods_url(@food_truck)
  end

  def edit
    @food = @food_truck.foods.find(params[:id])
  end

  def update
    @food = @food_truck.foods.find(params[:id])
    if @food.update(food_params)
      redirect_to food_truck_foods_path(@food_truck)
    else
      render :action => "edit"
    end
  end

  protected

  def food_params
    params.require(:food).permit(:name ,:price)
  end

  def set_food_truck
    @food_truck = FoodTruck.find(params[:food_truck_id])
  end
end
