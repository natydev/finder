require 'rails_helper'

RSpec.describe PlacesController, type: :controller do

  let!(:existant_place){ create(:place) }
  let(:valid_attributes) {
    attributes_for(:place)
  }
  let(:invalid_attributes) {
    attributes_for(:place, name: '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlacesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: existant_place.to_param}, session: valid_session
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
      get :edit, params: {id: existant_place.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Place" do
        expect {
          post :create, params: {place: valid_attributes}, session: valid_session
        }.to change(Place, :count).by(1)
      end

      it "redirects to the created place" do
        post :create, params: {place: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Place.order(:created_at).last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {place: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: Faker::Lorem.unique.sentence }
      }

      it "updates the requested place" do
        put :update, params: {id: existant_place.to_param, place: new_attributes}, session: valid_session
        existant_place.reload
        expect(existant_place.name).to eq(new_attributes[:name])
      end

      it "redirects to the place" do
        put :update, params: {id: existant_place.to_param, place: valid_attributes}, session: valid_session
        expect(response).to redirect_to(existant_place)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: existant_place.to_param, place: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested place" do
      expect {
        delete :destroy, params: {id: existant_place.to_param}, session: valid_session
      }.to change(Place, :count).by(-1)
    end

    it "redirects to the places list" do
      delete :destroy, params: {id: existant_place.to_param}, session: valid_session
      expect(response).to redirect_to(places_url)
    end
  end

end
