require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  let!(:existant_tag){ create(:tag) }
  let(:valid_attributes) {
    attributes_for(:tag)
  }
  let(:invalid_attributes) {
    attributes_for(:tag, name: '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: existant_tag.to_param}, session: valid_session
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
      get :edit, params: {id: existant_tag.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Tag" do
        expect {
          post :create, params: {tag: valid_attributes}, session: valid_session
        }.to change(Tag, :count).by(1)
      end

      it "redirects to the created tag" do
        post :create, params: {tag: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Tag.order(:created_at).last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {tag: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: Faker::Lorem.unique.sentence }
      }

      it "updates the requested tag" do
        put :update, params: {id: existant_tag.to_param, tag: new_attributes}, session: valid_session
        existant_tag.reload
        expect(existant_tag.name).to eq(new_attributes[:name])
      end

      it "redirects to the tag" do
        put :update, params: {id: existant_tag.to_param, tag: valid_attributes}, session: valid_session
        expect(response).to redirect_to(existant_tag)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: existant_tag.to_param, tag: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested tag" do
      expect {
        delete :destroy, params: {id: existant_tag.to_param}, session: valid_session
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the tags list" do
      delete :destroy, params: {id: existant_tag.to_param}, session: valid_session
      expect(response).to redirect_to(tags_url)
    end
  end

end
