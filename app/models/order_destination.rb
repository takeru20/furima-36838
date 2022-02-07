class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :area_id, :municipalities, :address, :building, :telephone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Destination.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address,
                       building: building, telephone_number: telephone_number, order_id: order.id)
  end
end