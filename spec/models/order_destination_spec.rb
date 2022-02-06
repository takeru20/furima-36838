require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @order_destination = FactoryBot.build(:order_destination)
  end

  describe '商品購入' do
    context '商品購入ができる場合' do
      it '入力必須項目が全て正しく入力されていれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end


    context '商品購入ができない場合' do
      it 'post_codeが空だと保存できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid")
      end
      it 'area_idが1だと保存できない' do
        @order_destination.area_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Area can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_destination.address = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できない' do
        @order_destination.telephone_number = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end
    end
  end
end