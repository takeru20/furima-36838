FactoryBot.define do
  factory :product do
    title                { 'タイトル' }
    description          { '内容' }
    category_id          { '2' }
    product_condition_id { '2' }
    shipping_fee_id      { '2' }
    area_id              { '2' }
    shipping_date_id     { '2' }
    price                { '1000' }

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
