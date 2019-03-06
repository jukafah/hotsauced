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

  context 'object validation' do
    context 'name' do
      context 'when valid' do
        it 'passes form validation' do
          post about_contact_validate_path, params: { format: 'json', contact: { name: 'Name' } }
          valid = response_body['valid']
          field = response_body['field_name']
          expect(valid).to be(true)
          expect(field).to eq('name')
        end
      end

      context 'when invalid' do
        it 'fails form validation' do
          post about_contact_validate_path, params: { format: 'json', contact: { name: nil } }
          valid = response_body['valid']
          field = response_body['field_name']
          expect(valid).to be(false)
          expect(field).to eq('name')
        end
      end
    end

    context 'email' do
      context 'when valid' do
        it 'passes form validation' do
          post about_contact_validate_path, params: { format: 'json', contact: { email: 'Email' } }
          valid = response_body['valid']
          field = response_body['field_name']
          expect(valid).to be(true)
          expect(field).to eq('email')
        end
      end

      context 'when invalid' do
        it 'fails form validation' do
          post about_contact_validate_path, params: { format: 'json', contact: { email: nil } }
          valid = response_body['valid']
          field = response_body['field_name']
          expect(valid).to be(false)
          expect(field).to eq('email')
        end
      end
    end

    context 'body' do
      context 'when valid' do
        it 'passes form validation' do
          post about_contact_validate_path, params: { format: 'json', contact: { body: 'Body' } }
          valid = response_body['valid']
          field = response_body['field_name']
          expect(valid).to be(true)
          expect(field).to eq('body')
        end
      end

      context 'when invalid' do
        it 'fails form validation' do
          post about_contact_validate_path, params: { format: 'json', contact: { body: nil } }
          valid = response_body['valid']
          field = response_body['field_name']
          expect(valid).to be(false)
          expect(field).to eq('body')
        end
      end
    end

    def response_body
      JSON.parse(response.body)
    end
  end
end
