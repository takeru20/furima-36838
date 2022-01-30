class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :area_id, :municipalities, :address, :building, :telephone_number, :order

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :address
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Destination.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address,
                       building: building, telephone_number: telephone_number, order: order)
  end
end