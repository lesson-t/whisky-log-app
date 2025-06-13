class Whisky < ApplicationRecord
  belongs_to :user

  has_many_attached :images

  validates :name, :genre, :country, :status, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validate :images_count_within_limit

  enum status: { 未飲: 0, 飲んだ: 1 }

  def images_count_within_limit
    if images.attachments.size > 3
      errors.add(:images, "は最大3枚までアップロードできます")
    end
  end
end
