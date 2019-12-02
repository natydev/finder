require 'rails_helper'

RSpec.describe "spots/new", type: :view do
  before(:each) do
    assign(:spot, Spot.new(
      :place => nil,
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders new spot form" do
    render

    assert_select "form[action=?][method=?]", spots_path, "post" do

      assert_select "input[name=?]", "spot[place_id]"

      assert_select "input[name=?]", "spot[name]"

      assert_select "input[name=?]", "spot[slug]"
    end
  end
end
