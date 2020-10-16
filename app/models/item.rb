class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_day
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :condition_id, :prefecture_id,:shipping_cost_id, :shipping_day_id, numericality: { other_than: 1 } 
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :description
    
  end 
end
