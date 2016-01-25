class ApiV1::FoodsController < ApplicationController

 # GET /api/v1/foods/:id
  def show
    @foods = Food.find(params[:id])

    # show.json.jbuilder
  end

  # GET /api/v1/foods
  def index
    @foods = Food.page( params[:page] )
      respond_to do |format|
        format.html
        format.json
      end
    # index.json.jbuilder
  end

end