module SharedExamples
  module NestedControllerSuccess

    RSpec.shared_examples "nested_controller_success" do |klass, change_attr|
      let!(:subject_key) { klass.name.underscore.to_sym }
      let!(:parent_key) { @parent_record.class.name.foreign_key.to_sym  }

      before(:each) do
        sign_in_user(owner)
      end

      describe "GET #index" do
        it "returns a success response" do
          get :index, params: {parent_key => @parent_record.id}, session: {}
          expect(response).to be_successful
        end
      end

      describe "GET #show" do
        it "returns a success response" do
          get :show, params: {parent_key => @parent_record.id,
              id: existant_record.to_param}, session: {}
          expect(response).to be_successful
        end
      end

      describe "GET #new" do
        it "returns a success response" do
          get :new, params: {parent_key => @parent_record.id}, session: {}
          expect(response).to be_successful
        end
      end

      describe "GET #edit" do
        it "returns a success response" do
          get :edit, params: {parent_key => @parent_record.id, 
              id: existant_record.to_param}, session: {}
          expect(response).to be_successful
        end
      end

      describe "POST #create" do
        context "with valid params" do
          it "creates a new #{klass.name}" do
            expect {
              post :create, params: {parent_key => @parent_record.id, 
                   subject_key => valid_attributes}, session: {}
            }.to change(klass, :count).by(1)
          end

          it "redirects to the created record" do
            post :create, params: {parent_key => @parent_record.id, 
                 subject_key => valid_attributes}, session: {}
            expect(response).to redirect_to([@parent_record, klass.order(:created_at).last])
          end
        end

        context "with invalid params" do
          it "returns a success response (i.e. to display the 'new' template)" do
            post :create, params: {parent_key => @parent_record.id, 
                 subject_key => invalid_attributes}, session: {}
            expect(response).to be_successful
          end
        end
      end

      describe "PUT #update" do
        context "with valid params" do
          it "updates the requested record" do
            put :update, params: {parent_key => @parent_record.id, id: existant_record.to_param,
                         subject_key => valid_attributes}, session: {}
            existant_record.reload
            expect(existant_record.public_send(change_attr)).to eq(valid_attributes[change_attr])
          end

          it "redirects to the record" do
            put :update, params: {parent_key => @parent_record.id, id: existant_record.to_param,
                         subject_key => valid_attributes}, session: {}
            expect(response).to redirect_to([@parent_record, existant_record])
          end
        end

        context "with invalid params" do
          it "returns a success response (i.e. to display the 'edit' template)" do
            put :update, params: {parent_key => @parent_record.id, id: existant_record.to_param,
                         subject_key => invalid_attributes}, session: {}
            expect(response).to be_successful
          end
        end
      end

      describe "DELETE #destroy" do
        it "destroys the requested record" do
          expect {
            delete :destroy, params: {parent_key => @parent_record.id, 
                   id: existant_record.to_param}, session: {}
          }.to change(klass, :count).by(-1)
        end

        it "redirects to the records list" do
          delete :destroy, params: {parent_key => @parent_record.id, 
                 id: existant_record.to_param}, session: {}
          expect(response).to redirect_to(@parent_record)
        end
      end
    end

  end
end
