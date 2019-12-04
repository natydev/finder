require 'rails_helper'

RSpec.describe "boxes/edit", type: :view do
  before(:each) do
    @box = assign(:box, Box.create!(
      :spot => nil,
      :owner => nil,
      :summary => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit box form" do
    render

    assert_select "form[action=?][method=?]", box_path(@box), "post" do

      assert_select "input[name=?]", "box[spot_id]"

      assert_select "input[name=?]", "box[owner_id]"

      assert_select "input[name=?]", "box[summary]"

      assert_select "input[name=?]", "box[code]"
    end
  end
end
