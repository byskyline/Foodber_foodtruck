class OrdersController < ApplicationController

	def create
		@order = Order.new( order_params[:name] )	
		if @order.save
		end
	end

	private

	def order_params
      params.require(:order).permit(:name)
  end

end
