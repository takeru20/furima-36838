require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, product_id: product.id)
    sleep 0.02
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it '入力必須項目が全て正しく入力されていれば購入できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end


    context '商品購入ができない場合' do
      it 'post_codeが空では購入できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid")
      end
      it 'area_idが1では購入できない' do
        @order_destination.area_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空では購入できない' do
        @order_destination.municipalities = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_destination.address = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空では購入できない' do
        @order_destination.telephone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9桁以下では購入できない' do
        @order_destination.telephone_number = '090123456'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁以上では購入できない' do
        @order_destination.telephone_number = '090123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberに半角数字以外が含まれている場合は購入できない' do
        @order_destination.telephone_number = '０９０１２３４５６７８'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'tokenが空では購入できない' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていなければ購入できない' do
        @order_destination.product_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end