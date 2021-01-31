FactoryBot.define do
  factory :user do
    Faker::Config.locale = :en
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password }
    password_confirmation { password }
    Faker::Config.locale = :ja
    family_name           { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    kana_family_name      { Faker::Name.last_name }
    kana_first_name       { Faker::Name.first_name }
    birthday              { Faker::Date.birthday }
  end
end
