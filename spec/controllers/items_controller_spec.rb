require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:box){ create(:box, :cluster) }
  let!(:existant_item){ create(:item, box: box) }
  let(:valid_attributes) {
    attributes_for(:item, box_id: box.id)
  }

  let(:invalid_attributes) {
    attributes_for(:item, box_id: box.id, summary: '')
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {box_id: box.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {box_id: box.id, id: existant_item.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {box_id: box.id}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {box_id: box.id, id: existant_item.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, params: {box_id: box.id, item: valid_attributes}, session: valid_session
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post :create, params: {box_id: box.id, item: valid_attributes}, session: valid_session
        expect(response).to redirect_to([box, Item.order(:created_at).last])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {box_id: box.id, item: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let!(:new_attributes) {
        {summary: Faker::Lorem.unique.sentence}
      }
      it "updates the requested item" do
        put :update, params: {box_id: box.id, id: existant_item.to_param,
         item: new_attributes}, session: valid_session
        existant_item.reload
        expect(existant_item.summary).to eq(new_attributes[:summary])
      end

      it "redirects to the item" do
        put :update, params: {box_id: box.id, id: existant_item.to_param,
         item: valid_attributes}, session: valid_session
        expect(response).to redirect_to([box, existant_item])
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {box_id: box.id, id: existant_item.to_param,
         item: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      expect {
        delete :destroy, params: {box_id: box.id,
         id: existant_item.to_param}, session: valid_session
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list (box details)" do
      delete :destroy, params: {box_id: box.id,
       id: existant_item.to_param}, session: valid_session
      expect(response).to redirect_to(box)
    end
  end
end
