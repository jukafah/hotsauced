# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about page', type: :request do
  it 'responds successfully' do
    get '/about'
    expect(response).to have_http_status(:ok)
  end

  it 'responds with ABOUT active on navbar' do
    get '/about'
    expect(response.body).to have_selector('.nav-link.active', count: 1, text: 'ABOUT')
  end

  describe 'Send contact email' do
    context 'when valid' do
      it 'sends successfully and shows modal' do
        post '/about/contact', params: { format: 'js', contact: { name: 'Name', email: 'someone@somewhere.com', body: 'This is a body!' } }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'when invalid' do
      it 'reloads page with errors' do
        post '/about/contact', params: { format: 'js', contact: { name: nil, email: nil, body: nil } }
        expect(response.body).to have_text("$('#name').addClass('is-invalid');")
        expect(response.body).to have_text("$('#email').addClass('is-invalid');")
        expect(response.body).to have_text("$('#body').addClass('is-invalid');")
      end
    end
  end
end
