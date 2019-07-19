class Photo < ApplicationRecord
  belongs_to :album
  has_one_attached :image
  validate :image_presence
  validate :upload_is_image

  private

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  def upload_is_image
    return unless image.attached?

    unless image.content_type =~ /^image\/(jpeg|pjpeg|gif|png|bmp)$/
      errors.add(:upload, 'not a valid image')
    end
  end
end
