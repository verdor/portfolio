require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  it "displays Album" do
    render
    expect(rendered).to match /Home#index/
  end
end
