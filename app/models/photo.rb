class Photo < ApplicationRecord
  belongs_to :gallery

  mount_uploader :photo, PhotoUploader

  def size(version = :standard)
    if photo?
      photo.versions[version].url
    else
      ""
    end
  end

end
