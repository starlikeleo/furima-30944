FactoryBot.define do
  factory :BuyDestination do
    postal_code                  { '123-4567' }
    delivery_area_id             { Faker::Number.between(from: 1, to: 47) }
    municipal_name                  { '123-4567' }
    house_number                  { '123-4567' }
    building_name                  { '123-4567' }
    tell                  { '09012345678' }
  end
end