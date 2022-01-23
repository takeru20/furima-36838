require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品ができる場合' do
      it '商品出品画面の全ての項目が入力されていれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'imageが空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では出品できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end

      it 'descriptionが空では出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが1の場合は出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_condition_idが1の場合は出品できない' do
        @product.product_condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition can't be blank")
      end

      it 'shipping_fee_idが1の場合は出品できない' do
        @product.shipping_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'area_idが1の場合は出品できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end

      it 'shipping_date_idが1の場合は出品できない' do
        @product.shipping_date_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end

      it 'priceが空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300円未満では出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9_999_999円を超えると出品できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'userが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
