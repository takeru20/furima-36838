class ProductsController < ApplicationController

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

  def edit
    @product = Product.find(params[:id])
    unless @product.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render "items/edit"
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :product_condition_id, :shipping_fee_id, :area_id,
                                    :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
