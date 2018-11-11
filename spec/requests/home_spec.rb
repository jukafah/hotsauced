# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  it 'displays page content' do
    get '/'
    expect(response).to have_http_status(:ok)
  end

  it 'display with HOME active on navbar' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response.body).to have_selector('home.nav-link.active', count: 1)
  end

  it 'root redirects to /home' do
    get '/'
    expect(response).to redirect_to('/home')
  end
end
