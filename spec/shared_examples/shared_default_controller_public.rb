# frozen_string_literal: true

module SharedExamples
  module DefaultControllerPublic
    RSpec.shared_examples 'default_controller_public' do |klass, _change_attr|
      let!(:subject_key) { klass.name.underscore.to_sym }

      describe 'GET #index' do
        it 'returns a redirection to login' do
          get :index, params: {}, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe 'GET #show' do
        it 'returns a redirection to login' do
          get :show, params: { id: existant_record.to_param }, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe 'GET #new' do
        it 'returns a redirection to login' do
          get :new, params: {}, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe 'GET #edit' do
        it 'returns a redirection to login' do
          get :edit, params: { id: existant_record.to_param }, session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe 'POST #create' do
        context 'with valid params' do
          it "does not creates a new #{klass.name}" do
            expect do
              post :create, params: { subject_key => valid_attributes },
                            session: {}
            end.to_not change(klass, :count)
          end

          it 'returns a redirection to login' do
            post :create, params: { subject_key => valid_attributes },
                          session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context 'with invalid params' do
          it 'returns a redirection to login' do
            post :create, params: { subject_key => invalid_attributes },
                          session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe 'PUT #update' do
        context 'with valid params' do
          it 'returns a redirection to login' do
            put :update, params: { id: existant_record.to_param,
                                   subject_key => valid_attributes }, session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end

        context 'with invalid params' do
          it 'returns a redirection to login' do
            put :update, params: { id: existant_record.to_param,
                                   subject_key => invalid_attributes }, session: {}
            expect(response).to have_http_status(:found)
            expect(response).to redirect_to(new_user_session_path)
          end
        end
      end

      describe 'DELETE #destroy' do
        it 'does not destroys the requested record' do
          expect do
            delete :destroy, params: { id: existant_record.to_param },
                             session: {}
          end.to_not change(klass, :count)
        end

        it 'returns a redirection to login' do
          delete :destroy, params: { id: existant_record.to_param },
                           session: {}
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end
end
