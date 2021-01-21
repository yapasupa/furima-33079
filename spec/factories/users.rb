FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"aaa000"}
    password_confirmation {password}
    first_name            {"阿部"}
    last_name             {"隆"}
    first_name_kana       {"アベ"}
    last_name_kana        {"タカシ"}
    birthday              {"1990-12-12"}
  end
end