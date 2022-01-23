class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'items/new'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to item_path(@product.id)
    else
      render 'items/edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :product_condition_id, :shipping_fee_id, :area_id,
                                    :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end
end
