require 'rails_helper'

RSpec.describe "boxes/new", type: :view do
  before(:each) do
    assign(:box, Box.new(
      :spot => nil,
      :owner => nil,
      :summary => "MyString",
      :code => "MyString"
    ))
  end

  it "renders new box form" do
    render

    assert_select "form[action=?][method=?]", boxes_path, "post" do

      assert_select "input[name=?]", "box[spot_id]"

      assert_select "input[name=?]", "box[owner_id]"

      assert_select "input[name=?]", "box[summary]"

      assert_select "input[name=?]", "box[code]"
    end
  end
end
