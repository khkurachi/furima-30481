FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/staff.jpg'), filename: 'staff.jpg')
    end
    title {"test"}
    description {Faker::Lorem.sentence}
    category_id {"2"}
    condition_id {"2"}
    shipping_cost_id {"2"}
    prefecture_id {"2"}
    shipping_day_id {"2"}
    value {"333"}
    association :user
  end
end
