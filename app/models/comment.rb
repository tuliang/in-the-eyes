class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  scope :latest, -> { order(updated_at: :desc) }

  validates :content, presence: true, length: { minimum: 1 }
end
