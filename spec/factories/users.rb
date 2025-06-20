# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" } # ← 重複しないようにする
    password { 'password' }
    password_confirmation { 'password' }
  end
end
