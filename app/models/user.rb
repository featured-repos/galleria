class User < ApplicationRecord
  has_many :galleries
  has_many :photos, through: :galleries
  has_secure_password

  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true

  mount_uploader :avatar, AvatarUploader
end
