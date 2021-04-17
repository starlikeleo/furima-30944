FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    password = Faker::Internet.password(min_length: 10, max_length: 20)

    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { password }
    password_confirmation { password }
    family_name           { person.last.kanji }
    first_name            { person.first.kanji }
    kana_family_name      { person.last.katakana }
    kana_first_name       { person.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
