module SharedExamples
  module NestedControllerPublic

    RSpec.shared_examples "nested_controller_public" do |klass, change_attr|
      let!(:subject_key) { klass.name.underscore.to_sym }
      let!(:parent_key) { @parent_record.class.name.foreign_key.to_sym  }

      describe "GET #index" do
        it "returns a redirection to login" do
          get :index, params: {parent_key => @parent_record.id}, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET #show" do
        it "returns a redirection to login" do
          get :show, params: {parent_key => @parent_record.id, id: existant_record.to_param},
                     session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET #new" do
        it "returns a redirection to login" do
          get :new, params: {parent_key => @parent_record.id}, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "GET #edit" do
        it "returns a redirection to login" do
          get :edit, params: {parent_key => @parent_record.id,
                     id: existant_record.to_param}, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe "POST #create" do
        context "with valid params" do
          it "does not creates a new #{klass.name}" do
            expect {
              post :create, params: {parent_key => @parent_record.id,
                    subject_key => valid_attributes}, session: {}
            }.to_not change(klass, :count)
          end

          it "returns a redirection to login" do
            post :create, params: {parent_key => @parent_record.id,
                  subject_key => valid_attributes}, session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid params" do
          it "returns a redirection to login" do
            post :create, params: {parent_key => @parent_record.id,
                  subject_key => invalid_attributes}, session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe "PUT #update" do
        context "with valid params" do
          it "returns a redirection to login" do
            put :update, params: {parent_key => @parent_record.id, id: existant_record.to_param,
                subject_key => valid_attributes}, session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context "with invalid params" do
          it "returns a redirection to login" do
            put :update, params: {parent_key => @parent_record.id, id: existant_record.to_param,
                subject_key => invalid_attributes}, session: {}
                expect(response).to have_http_status(:found)
                expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe "DELETE #destroy" do
        it "does not destroys the requested record" do
          expect {
            delete :destroy, params: {parent_key => @parent_record.id,
                   id: existant_record.to_param}, session: {}
          }.to_not change(klass, :count)
        end

        it "returns a redirection to login" do
          delete :destroy, params: {parent_key => @parent_record.id,
                 id: existant_record.to_param}, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end

  end
end
