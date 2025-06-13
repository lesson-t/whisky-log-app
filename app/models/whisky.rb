class Whisky < ApplicationRecord
  belongs_to :user

  validates :name, :genre, :country, :status, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true

  enum status: { 未飲: 0, 飲んだ: 1 }
end
