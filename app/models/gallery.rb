class Gallery < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :title, presence: true

  def owned_by?(this_user)
    user == this_user
  end

end
