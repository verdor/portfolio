require 'rails_helper'

RSpec.describe 'albums/edit', type: :view do
  before(:each) do
    @album = assign(:album, Album.create!(
                              :name => 'MyString',
                              :description => 'MyText'
                            ))
  end

  it 'renders the edit album form' do
    render

    assert_select 'form[action=?][method=?]', album_path(@album), 'post' do
      assert_select 'input[name=?]', 'album[name]'

      assert_select 'textarea[name=?]', 'album[description]'
    end
  end
end
