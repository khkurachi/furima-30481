class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }  
    validates :munipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  end
end
