class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    redirect_to action: :index unless @product.user_id == current_user.id
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :product_condition_id, :shipping_fee_id, :area_id,
                                    :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
