class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  validates :prefecture_id, presence: true, numericality: { other_than: 1 } 
  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
  end
end
