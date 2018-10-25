class Image < ApplicationRecord
  scope :eyes, -> { where(image_type: %i[eye]) }
  scope :pictures, -> { where(image_type: %i[picture]) }
  scope :photos, -> { where(image_type: %i[photo]) }
  scope :emoticons, -> { where(image_type: %i[emoticon]) }

  enum image_type: { eye: 0, picture: 1, photo: 2, emoticon: 3 }
end
