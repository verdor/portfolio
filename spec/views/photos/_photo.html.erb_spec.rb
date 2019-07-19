require 'rails_helper'

RSpec.describe 'photos/_photo', type: :view do
  before(:each) do
    album = Album.new
    image = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    @photo = assign(:photo, Photo.create!(
                              :name => 'MyString',
                              :description => 'MyText',
                              :favourite => true,
                              :album => album,
                              :image => image
                            ))
  end

  it 'renders attributes favourite true' do
    render @photo
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/btn-warning/)
    expect(rendered).to match(//)
  end

  it 'renders attributes favourite false' do
    @photo.update(favourite: false)
    @photo.reload
    render @photo
    expect(rendered).to match(/MyString/)
    expect(rendered).to match(/MyText/)
    expect(rendered).not_to match(/btn-warning/)
    expect(rendered).to match(//)
  end
end
