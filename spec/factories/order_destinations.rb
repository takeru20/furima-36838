FactoryBot.define do
  factory :order_destination do
    post_code        { '123-4567' }
    area_id          { '2' }
    municipalities   { '新宿区' }
    address          { '1-1' }
    building         { '新宿ハイツ' }
    telephone_number { '09012345678' }
    token            { 'token'}
  end
end
