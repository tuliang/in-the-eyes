class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  scope :latest, -> { order(updated_at: :desc) }
end
