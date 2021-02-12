FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 10) }
    password_confirmation { password }
    family_name           { person.last.kanji }
    first_name            { person.first.kanji }
    kana_family_name      { person.last.katakana }
    kana_first_name       { person.first.katakana }
    birthday              { Faker::Date.birthday }
  end
  
end
