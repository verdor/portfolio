class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image
  validate :image_presence

  private

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
