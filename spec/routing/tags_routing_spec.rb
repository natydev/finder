require "rails_helper"

RSpec.describe TagsController, type: :routing do
  describe "routing" do
    let!(:id){ rand_id }
    it "routes to #index" do
      expect(:get => "/tags").to route_to("tags#index")
    end

    it "routes to #new" do
      expect(:get => "/tags/new").to route_to("tags#new")
    end

    it "routes to #show" do
      expect(:get => "/tags/#{id}").to route_to("tags#show", :id => id)
    end

    it "routes to #edit" do
      expect(:get => "/tags/#{id}/edit").to route_to("tags#edit", :id => id)
    end


    it "routes to #create" do
      expect(:post => "/tags").to route_to("tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tags/#{id}").to route_to("tags#update", :id => id)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tags/#{id}").to route_to("tags#update", :id => id)
    end

    it "routes to #destroy" do
      expect(:delete => "/tags/#{id}").to route_to("tags#destroy", :id => id)
    end
  end
end
