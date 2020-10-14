FactoryBot.define do
  factory :user do
    name              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"a234567"}
    password_confirmation    {"a234567"}
    l_name_kanji           {"山田"}
    l_name_kana      {"ヤマダ"}
    f_name_kanji            {"太郎"}
    f_name_kana       {"タロウ"}
    birthday             {"2000-01-01"}
  end
end