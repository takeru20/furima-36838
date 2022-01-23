class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :set_product,        only: [:show, :edit, :update, :destroy]
  before_action :set_current_user,   only: [:edit, :destroy]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :product_condition_id, :shipping_fee_id, :area_id,
                                    :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_current_user
    redirect_to action: :index unless @product.user_id == current_user.id
  end
end

# items_controllerを削除しproducts_controllerへ集約
# items_controllerのコードを念のため保管

# class ItemsController < ApplicationController
#   before_action :authenticate_user!, only: [:new, :edit]
#   before_action :set_product, only: [:show, :edit]

#   def index
#     @products = Product.all.order(created_at: :desc)
#   end

#   def new
#     @product = Product.new
#   end

#   def show
#   end

#   def edit
#     redirect_to action: :index unless @product.user_id == current_user.id
#   end

#   private

#   def set_product
#     @product = Product.find(params[:id])
#   end
# end