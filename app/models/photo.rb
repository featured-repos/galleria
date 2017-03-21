class Photo < ApplicationRecord
  belongs_to :gallery
  belongs_to :user

  # validates :photo, presence: true

  mount_uploader :photo, PhotoUploader

  default_scope { order(created_at: :desc) }

  def size(version = :standard)
    if photo?
      photo.versions[version].url
    else
      ""
    end
  end

  def owned_by?(this_user)
    user == this_user
  end

  def next
    gallery.photos.where("photos.created_at < ?", created_at).first
  end

  def previous
    gallery.photos.where("photos.created_at > ?", created_at).last
  end

end
