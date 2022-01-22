require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe 'ユーザー新規登録' do
    context '商品出品ができる場合' do
      it '商品出品画面の全ての項目が入力されていれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では登録できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では登録できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_condition_idが空では登録できない' do
        @product.product_condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition can't be blank")
      end

      it 'shipping_fee_idが空では登録できない' do
        @product.shipping_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'area_idが空では登録できない' do
        @product.area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end

      it 'shipping_date_idが空では登録できない' do
        @product.shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'priceが空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is invalid')
      end
    end
  end
end
