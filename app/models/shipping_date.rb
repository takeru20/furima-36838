class ShippingDate < ActiveHash::Base
  self.data = [
    { id: 1, shipping_date_id: '--' },
    { id: 2, shipping_date_id: '1~2日で発送' }, { id: 3, shipping_date_id: '2~3日で発送' },
    { id: 4, shipping_date_id: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :products
end
