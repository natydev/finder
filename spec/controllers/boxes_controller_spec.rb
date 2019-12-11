require 'rails_helper'

RSpec.describe BoxesController, type: :controller do

  let(:spot) { create(:spot) }
  let!(:existant_box){ create(:box) }
  let(:valid_attributes) {
    attributes_for(:box, spot_id: spot.id)
  }
  let(:invalid_attributes) {
    attributes_for(:box, summary: '', spot_id: spot.id)
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BoxesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: existant_box.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: existant_box.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Box" do
        expect {
          post :create, params: {box: valid_attributes}, session: valid_session
        }.to change(Box, :count).by(1)
      end

      it "redirects to the created box" do
        post :create, params: {box: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Box.order(:created_at).last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {box: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { summary: Faker::Lorem.unique.sentence }
      }

      it "updates the requested box" do
        put :update, params: {id: existant_box.to_param, box: new_attributes}, session: valid_session
        existant_box.reload
        expect(existant_box.summary).to eq(new_attributes[:summary])
      end

      it "redirects to the box" do
        put :update, params: {id: existant_box.to_param, box: valid_attributes}, session: valid_session
        expect(response).to redirect_to(existant_box)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: existant_box.to_param, box: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested box" do
      expect {
        delete :destroy, params: {id: existant_box.to_param}, session: valid_session
      }.to change(Box, :count).by(-1)
    end

    it "redirects to the boxes list" do
      delete :destroy, params: {id: existant_box.to_param}, session: valid_session
      expect(response).to redirect_to(boxes_url)
    end
  end

end
