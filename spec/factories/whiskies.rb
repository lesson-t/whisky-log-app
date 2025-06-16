FactoryBot.define do
  factory :whisky do
    name { "Yamazaki" }
    genre { "シングルモルト" }
    country { "日本" }
    status { "飲んだ" }
    drank_on { Date.today }
    user
  end
end