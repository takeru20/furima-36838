class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit]

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
    redirect_to action: :index unless @product.user_id == current_user.id
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end