FactoryBot.define do
  factory :BuyDestination do
    postal_code           { '123-4567' }
    delivery_area_id      { Faker::Number.between(from: 1, to: 47) }
    municipal_name        { '狭山市' }
    house_number          { '稲荷山2-3' }
    tell                  { '09012345678' }
    token                 {"tok_abcdefghijk00000000000000000"}
    user
    item
  end
end