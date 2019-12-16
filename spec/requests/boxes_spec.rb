require 'rails_helper'

RSpec.describe "Boxes", type: :request do
  describe "GET /boxes" do
    it "works! (now write some real specs)" do
      get boxes_path
      expect(response).to have_http_status(302)
    end
  end
end
