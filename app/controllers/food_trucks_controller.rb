class FoodTrucksController < ApplicationController

  before_action :authenticate_user!, :except => [:get_order]

  before_action :set_food_truck, only: [:show, :edit, :update, :destroy, :driver, :location_upload, :check]

  skip_before_action :verify_authenticity_token, only: [:get_order]
  # GET /food_trucks
  # GET /food_trucks.json
  def index
    if current_user.admin?
      @food_trucks_for_all = FoodTruck.all
      @food_trucks = FoodTruck.page(params[:page]).per(10)
    else
      @food_trucks_for_all = FoodTruck.where( email: current_user.email )
      @food_trucks = FoodTruck.where( email: current_user.email ).page(params[:page]).per(3)
    end
  end

  def show
  end

  def new
    @food_truck = FoodTruck.new
  end

  def edit
  end

  def create
    @food_truck = FoodTruck.new(food_truck_params)

    respond_to do |format|
      if @food_truck.save
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully created.' }
        format.json { render :show, status: :created, location: @food_truck }
      else
        format.html { render :new }
        format.json { render json: @food_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if params[:_remove_picture] == "1"
      @food_truck.picture = nil
    end

    respond_to do |format|
      if @food_truck.update(food_truck_params)
        format.html { redirect_to @food_truck, notice: 'Food truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_truck }
      else
        format.html { render :edit }
        format.json { render json: @food_truck.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food_truck.destroy
    respond_to do |format|
      format.html { redirect_to food_trucks_url, notice: 'Food truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def driver
    @food_truck.get_order = '0'
    @food_truck.save!
  end

  def check
    @food_truck.get_order = '0'
    @food_truck.save!
  end

  def location_upload
    @food_truck.latitude = food_truck_position_params[:latitude]
    @food_truck.longitude = food_truck_position_params[:longitude]

    @food_truck.save!

    render :json => { :message => "ok" }
  end

  # for API. this should move to api_v1  
  def get_order

    @food_truck = FoodTruck.find(order_params[:id])

    if order_params[:get_order]
      @food_truck.get_order = '1'
      @food_truck.save!
      respond_to do |format|
        format.json {
          render :json => { :get_order => @food_truck.get_order }
        }
      end
    else
      respond_to do |format|
        format.json {
          render :json => { :get_order => @food_truck.get_order }
        }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_truck
      @food_truck = FoodTruck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_truck_params
      params.require(:food_truck).permit(:name, :longitude, :latitude, :picture, :email)
    end

    def food_truck_position_params
      params.require(:food_truck).permit(:latitude, :longitude)
    end

    def order_params
      params.permit(:get_order, :id)
    end
      
end
