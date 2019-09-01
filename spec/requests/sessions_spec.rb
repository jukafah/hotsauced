# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  context 'creating new sessions' do
    context 'when resource is found' do
      it 'responds with 200' do
        get signin_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid parameters' do
      it 'user is logged in' do
        user = FactoryBot.create(:user)
        post signin_path, params: { email: user.email, password: user.password }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'responds with unauthorized' do
        FactoryBot.create(:user)
        post signin_path, params: { email: 'invalid', password: 'invalid' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'deleting active sessions' do
    context 'when signed in' do
      it 'user can sign out' do
        user = FactoryBot.create(:user)
        post signin_path, params: { email: user.email, password: user.password }
        get signout_path
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
