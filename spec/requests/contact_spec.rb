# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'contact', type: :request do
  it 'GET page' do
    get '/contact'
    expect(response).to have_http_status(:ok)
  end

  describe 'Send contact email' do
    context 'when valid' do
      it 'posts successfully with required parameters' do
        post '/contact', params: { message: { name: 'Name', email: 'someone@somewhere.com', body: 'This is a body!' } }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to('/contact')
      end
    end
  end
end
