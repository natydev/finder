require 'rails_helper'

RSpec.describe "boxes/show", type: :view do
  before(:each) do
    @box = assign(:box, Box.create!(
      :spot => nil,
      :owner => nil,
      :summary => "Summary",
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Summary/)
    expect(rendered).to match(/Code/)
  end
end
