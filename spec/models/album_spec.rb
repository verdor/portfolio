require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'associations' do
    it 'should have many photos' do
      a = Album.reflect_on_association(:photos)
      expect(a.macro).to eq(:has_many)
    end
  end
end
