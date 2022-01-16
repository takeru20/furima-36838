class  Product_condition < ActiveHash::Base

  self.data = [
    {id: 1, product_condition_id: '--'},
    {id: 2, product_condition_id: '新品・未使用'}, {id: 3, product_condition_id: '未使用に近い'},
    {id: 4, product_condition_id: '目立った傷や汚れなし'}, {id: 7, product_condition_id: 'やや傷や汚れあり'},
    {id: 6, product_condition_id: '傷や汚れあり'}, {id: 5, product_condition_id: '全体的に状態が悪い'},
  ]
  
   include ActiveHash::Associations
   has_many :products

  end