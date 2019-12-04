require 'rails_helper'

RSpec.describe "boxes/index", type: :view do
  before(:each) do
    assign(:boxes, [
      Box.create!(
        :spot => nil,
        :owner => nil,
        :summary => "Summary",
        :code => "Code"
      ),
      Box.create!(
        :spot => nil,
        :owner => nil,
        :summary => "Summary",
        :code => "Code"
      )
    ])
  end

  it "renders a list of boxes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
