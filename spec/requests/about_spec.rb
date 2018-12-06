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
end
