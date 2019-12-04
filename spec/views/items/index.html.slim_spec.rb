require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :box => nil,
        :summary => "Summary"
      ),
      Item.create!(
        :box => nil,
        :summary => "Summary"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Summary".to_s, :count => 2
  end
end
