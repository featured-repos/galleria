class Photo < ApplicationRecord
  belongs_to :gallery
  belongs_to :user

  mount_uploader :photo, PhotoUploader

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
    gallery.photos.where("photos.id > ?", id).first
  end

  def previous
    gallery.photos.where("photos.id < ?", id).last
  end

end
