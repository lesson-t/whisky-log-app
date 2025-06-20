# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

user = User.first || User.create!(email: 'sample@example.com', password: 'password')

image_path = Rails.root.join('app/assets/images/test1.jpg')

genres = %w[シングルモルト ブレンデッド グレーン バーボン]
countries = %w[日本 スコットランド アメリカ カナダ アイルランド]

20.times do
  whisky = user.whiskies.create!(
    name: "#{Faker::Beer.name} Whisky",
    genre: genres.sample,
    country: countries.sample,
    status: [0, 1].sample, # enum: 未飲 or 飲んだ
    rating: rand(1..5),
    comment: Faker::Lorem.sentence,
    drank_on: rand(30).days.ago
  )

  # ActiveStorage に画像を添付
  whisky.images.attach(
    io: File.open(image_path),
    filename: 'test1.jpg'
  )
end
