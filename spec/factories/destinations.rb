FactoryBot.define do
  factory :destination do
    name                  { Faker::Lorem.sentence }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 1, to: 10) }
    state_id              { Faker::Number.between(from: 1, to: 6) }
    delivery_fee_id       { Faker::Number.between(from: 1, to: 2) }
    area_id               { Faker::Number.between(from: 1, to: 47) }
    delivery_date_id      { Faker::Number.between(from: 1, to: 3) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
    
  end
end
