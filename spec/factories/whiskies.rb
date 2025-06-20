# frozen_string_literal: true

FactoryBot.define do
  factory :whisky do
    name { 'Yamazaki' }
    genre { 'シングルモルト' }
    country { '日本' }
    status { '飲んだ' }
    drank_on { Time.zone.today }
    user
  end
end
