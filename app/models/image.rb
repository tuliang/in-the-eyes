class Image < ApplicationRecord
  has_one_attached :file

  belongs_to :user
  has_many :comments

  scope :eyes, -> { where(image_type: Image.image_types[:eye]) }
  scope :pictures, -> { where(image_type: Image.image_types[:picture]) }
  scope :photos, -> { where(image_type: Image.image_types[:photo]) }
  scope :emoticons, -> { where(image_type: Image.image_types[:emoticon]) }

  scope :latest, -> { order(updated_at: :desc) }

  enum image_types: { eye: 0, picture: 1, photo: 2, emoticon: 3 }

  validates :title, presence: true, length: { maximum: 20 }
  validates :image_type, presence: true, inclusion: { in: [0, 1, 2, 3]}
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def image_thumb_url(process)
    self.file.service_url(params: { "x-oss-process" => process })
  end

  def room
    key
  end

  def up_hits
    $redis.hincrby(key, "hits", 1)
  end

  def hits
    $redis.hget(key, "hits").to_i
  end

  def key
    "#{self.class.name.downcase}_#{id}"
  end
end
