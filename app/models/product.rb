class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_fee
  belongs_to :area
  belongs_to :shipping_date

  validates :image,                presence: true
  validates :title,                presence: true
  validates :description,          presence: true
  validates :category_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :product_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,              numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :price,                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                                   format: { with: /\A[0-9]+\z/ }
end
