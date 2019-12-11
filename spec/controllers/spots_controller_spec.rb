require 'rails_helper'

RSpec.describe SpotsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Spot. As you add validations to Spot, be sure to
  # adjust the attributes here as well.
  let(:place){ create(:place) }
  let!(:existant_spot){ create(:spot, place: place) }
  let(:valid_attributes) {
    attributes_for(:spot, place_id: place.id)
  }
  let(:invalid_attributes) {
    attributes_for(:spot, place_id: place.id, name: '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpotsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {place_id: place.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {place_id: place.id, id: existant_spot.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {place_id: place.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {place_id: place.id, id: existant_spot.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Spot" do
        expect {
          post :create, params: {place_id: place.id, spot: valid_attributes}, session: valid_session
        }.to change(Spot, :count).by(1)
      end

      it "redirects to the created spot" do
        post :create, params: {place_id: place.id, spot: valid_attributes}, session: valid_session
        expect(response).to redirect_to([place, Spot.order(:created_at).last])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {place_id: place.id, spot: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let!(:new_attributes) {
        {name: Faker::Lorem.unique.sentence}
      }
      it "updates the requested spot" do
        put :update, params: {place_id: place.id, id: existant_spot.to_param,
         spot: new_attributes}, session: valid_session
        existant_spot.reload
        expect(existant_spot.name).to eq(new_attributes[:name])
      end

      it "redirects to the spot" do
        put :update, params: {place_id: place.id, id: existant_spot.to_param,
         spot: valid_attributes}, session: valid_session
        expect(response).to redirect_to([place, existant_spot])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {place_id: place.id, id: existant_spot.to_param,
         spot: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested spot" do
      expect {
        delete :destroy, params: {place_id: place.id,
         id: existant_spot.to_param}, session: valid_session
      }.to change(Spot, :count).by(-1)
    end

    it "redirects to the spots list" do
      delete :destroy, params: {place_id: place.id,
       id: existant_spot.to_param}, session: valid_session
      expect(response).to redirect_to(place_spots_url(place: place))
    end
  end

end
