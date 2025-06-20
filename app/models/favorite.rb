# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :whisky

  validates :user_id, uniqueness: { scope: :whisky_id }
end
