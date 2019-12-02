require 'rails_helper'

RSpec.describe "spots/edit", type: :view do
  before(:each) do
    @spot = assign(:spot, Spot.create!(
      :place => nil,
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders the edit spot form" do
    render

    assert_select "form[action=?][method=?]", spot_path(@spot), "post" do

      assert_select "input[name=?]", "spot[place_id]"

      assert_select "input[name=?]", "spot[name]"

      assert_select "input[name=?]", "spot[slug]"
    end
  end
end
