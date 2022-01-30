class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @order_destination = OrderDestination.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:user, :product, :post_code, :area_id, :municipalities, :address, :building, :telephone_number, :history).merge(
      user_id: current_user.id, product_id: params[:product_id]
    )
  end
end
