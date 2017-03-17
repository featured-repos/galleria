class User < ApplicationRecord
  has_many :galleries
  has_secure_password

  mount_uploader :avatar, AvatarUploader
end
