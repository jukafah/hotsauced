require 'rails_helper'

RSpec.describe "Users", type: :request do
  context 'creating new users' do
    context 'when resource is found' do
      it 'responds with 200' do
        get new_user_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid parameters' do
      it 'user is created and logged in' do
        post users_path, params: { user: { email: 'someone@somewhere.com', username: 'username', password: 'password' } }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid parameters' do
      it 'responds with 422' do
        post users_path, params: { user: { username: 'username' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when parameter is missing' do
      it 'raises parameter missing' do
        expect { post users_path, params: {} }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  context 'object validation' do
    context 'username' do
      context 'when valid' do
        it 'passes form validation' do
          post users_validate_path, params: { format: 'json', user: { username: 'Username' } }
          parsed_response = ActiveSupport::JSON.decode(response.body)
          valid = parsed_response['valid']
          field = parsed_response['field_name']
          expect(valid).to be(true)
          expect(field).to eq('username')
        end
      end

      context 'when invalid' do
        it 'fails form validation' do
          post users_validate_path, params: { format: 'json', user: { username: nil } }
          parsed_response = ActiveSupport::JSON.decode(response.body)
          valid = parsed_response['valid']
          field = parsed_response['field_name']
          expect(valid).to be(false)
          expect(field).to eq('username')
        end
      end
    end

    context 'email' do
      context 'when valid' do
        it 'passes form validation' do
          post users_validate_path, params: { format: 'json', user: { email: 'someone@somewhere.com' } }
          parsed_response = ActiveSupport::JSON.decode(response.body)
          valid = parsed_response['valid']
          field = parsed_response['field_name']
          expect(valid).to be(true)
          expect(field).to eq('email')
        end
      end

      context 'when invalid' do
        it 'fails form validation' do
          post users_validate_path, params: { format: 'json', user: { email: nil } }
          parsed_response = ActiveSupport::JSON.decode(response.body)
          valid = parsed_response['valid']
          field = parsed_response['field_name']
          expect(valid).to be(false)
          expect(field).to eq('email')
        end
      end
    end

    context 'password' do
      context 'when valid' do
        it 'passes form validation' do
          post users_validate_path, params: { format: 'json', user: { password: 'password' } }
          parsed_response = ActiveSupport::JSON.decode(response.body)
          valid = parsed_response['valid']
          field = parsed_response['field_name']
          expect(valid).to be(true)
          expect(field).to eq('password')
        end
      end

      context 'when invalid' do
        it 'fails form validation' do
          post users_validate_path, params: { format: 'json', user: { password: nil } }
          parsed_response = ActiveSupport::JSON.decode(response.body)
          valid = parsed_response['valid']
          field = parsed_response['field_name']
          expect(valid).to be(false)
          expect(field).to eq('password')
        end
      end
    end
  end
end
