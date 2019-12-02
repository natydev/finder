require 'rails_helper'

RSpec.describe "spots/index", type: :view do
  before(:each) do
    assign(:spots, [
      Spot.create!(
        :place => nil,
        :name => "Name",
        :slug => "Slug"
      ),
      Spot.create!(
        :place => nil,
        :name => "Name",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of spots" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
