class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :images
  has_many :comments

  # 是否是管理员
  def admin?
    "info@tuliang.org".freeze == email
  end
end
