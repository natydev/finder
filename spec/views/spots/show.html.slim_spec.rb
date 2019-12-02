require 'rails_helper'

RSpec.describe "spots/show", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :place => nil,
      :name => "Name",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Slug/)
  end
end
