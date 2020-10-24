FactoryBot.define do
  factory :address_purchase do
    postal_code {"111-1111"}
    prefecture_id {"2"}
    municipality {"適当市"}
    address {"適当"}
    phone_number {"0801111111"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end