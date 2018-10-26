class Image < ApplicationRecord
  mount_uploader :file, ImageUploader

  belongs_to :user 

  scope :eyes, -> { where(image_type: Image.image_types[:eye]) }
  scope :pictures, -> { where(image_type: Image.image_types[:picture]) }
  scope :photos, -> { where(image_type: Image.image_types[:photo]) }
  scope :emoticons, -> { where(image_type: Image.image_types[:emoticon]) }

  scope :latest, -> { order(updated_at: :desc) }

  enum image_types: { eye: 0, picture: 1, photo: 2, emoticon: 3 }
end
