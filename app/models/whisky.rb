# frozen_string_literal: true

class Whisky < ApplicationRecord
  belongs_to :user

  acts_as_taggable_on :tags

  has_many :favorites, dependent: :destroy
  has_many :favorited_by, through: :favorites, source: :user

  has_many_attached :images

  validates :name, :genre, :country, :status, presence: true
  validates :rating, inclusion: { in: 1..5 }, allow_nil: true
  validate :images_count_within_limit

  enum :status, { 未飲: 0, 飲んだ: 1 }

  def images_count_within_limit
    return unless images.attachments.size > 3

    errors.add(:images, 'は最大3枚までアップロードできます')
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[comment country created_at drank_on genre id id_value name rating status
       updated_at user_id]
  end
end
