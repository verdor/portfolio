require 'rails_helper'

RSpec.describe 'albums/index', type: :view do
  before(:each) do
    assign(:albums, [
             Album.create!(
               :name => 'Name',
               :description => 'MyText'
             ),
             Album.create!(
               :name => 'Name',
               :description => 'MyText'
             )
           ])
  end

  it 'renders a list of albums' do
    render
    assert_select 'div>h5', :text => 'Name'.to_s, :count => 2
    assert_select 'div>p', :text => 'MyText'.to_s, :count => 2
  end
end
