FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'0920reei'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_day             {'1999-09-09'}
  end
end 