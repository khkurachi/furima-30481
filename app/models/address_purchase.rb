class AddressPurchase

  include ActiveModel::Model
  attr_accessor :token, :prefecture_id, :postal_code, :municipality, :address, :phone_number, :building, :purchase_id, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }  
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/ }
  end
  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create!(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end