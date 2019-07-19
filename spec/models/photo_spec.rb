require 'rails_helper'

RSpec.describe Photo, type: :model do
  let(:album) { Album.create }
  let(:image) { fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png') }
  let(:icon) { fixture_file_upload(Rails.root.join('public', 'favicon.ico'), 'image/ico') }

  describe '#album' do
    it 'validates presence' do
      expect(Photo.create(image: image, album: nil)).to_not be_valid
      expect(Photo.create(image: image, album: album)).to be_valid
    end
  end

  describe '#image' do
    it 'validates image_presence' do
      photo = Photo.create(album: album, image: nil)
      expect(photo).to_not be_valid
      expect(photo.errors[:image]).to be_include("can't be blank")
      expect(Photo.create(album: album, image: image)).to be_valid
    end

    it 'validates upload_is_image' do
      photo = Photo.create(album: album, image: icon)
      expect(photo).to_not be_valid
      expect(photo.errors[:upload]).to be_include("not a valid image")
      expect(Photo.create(album: album, image: image)).to be_valid
    end
  end

  describe 'associations' do
    it "should belongs to an album" do
      p = Photo.reflect_on_association(:album)
      expect(p.macro).to eq(:belongs_to)
    end
  end
end
