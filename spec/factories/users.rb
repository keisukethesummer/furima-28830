FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"1234abcd"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"花子"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"ハナコ"}
    birthday              {"1995-01-01"}
  end
end