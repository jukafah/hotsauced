# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home page', type: :request do
  it 'responds successfully' do
    get '/home'
    expect(response).to have_http_status(:ok)
  end

  it 'responds with HOME active on navbar' do
    get '/home'
    expect(response.body).to have_selector('.nav-link.active', count: 1, text: 'HOME')
  end

  it 'root redirects to /home' do
    get '/'
    expect(response).to redirect_to('/home')
  end
end
