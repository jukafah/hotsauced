# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about', type: :request do
  context 'when resource is found' do
    it 'responds with 200' do
      get about_path
      expect(response).to have_http_status(:ok)
    end
  end

  context 'contact' do
    context 'with valid parameters' do
      it 'responds with 200' do
        post about_contact_path, params: { contact: { name: 'me', email: 'email', body: 'body' } }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'with invalid parameters' do
      it 'responds with 422' do
        post about_contact_path, params: { contact: { name: '', email: '', body: '' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
