class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_product_params, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
    if @product.order.present? || current_user == @product.user
      redirect_to root_path
  end
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_product
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:user, :product, :post_code, :area_id, :municipalities, :address, :building, :telephone_number, :order).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @product.price,
    card: order_params[:token],
    currency: 'jpy'
    )
  end

  def set_product_params
    @product = Product.find(params[:product_id])
  end
end