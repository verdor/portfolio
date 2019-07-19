require 'rails_helper'

RSpec.describe "photos/edit", type: :view do
  before(:each) do
    album = Album.new
    image = fixture_file_upload(Rails.root.join('public', 'apple-touch-icon.png'), 'image/png')
    @photo = assign(:photo, Photo.create!(
      :name => "MyString",
      :description => "MyText",
      :favourite => false,
      :album => album,
      :image => image
    ))
  end

  it "renders the edit photo form" do
    render

    assert_select "form[action=?][method=?]", photo_path(@photo), "post" do

      assert_select "input[name=?]", "photo[name]"

      assert_select "textarea[name=?]", "photo[description]"

      # assert_select "input[name=?]", "photo[favourite]"

      assert_select "input[name=?]", "photo[album_id]"
    end
  end
end
