# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome', type: :request do
  it 'displays page content' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response).to have_selector('.welcome-page-content', count: 1)
  end

  it 'displays site banner' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response).to have_selector('.site-banner', count: 1)
  end

  it 'display with HOME active on navbar' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response).to have_selector('.nav-link.active', count: 1)
  end

  it 'root redirects to /welcome' do
    get '/'
    expect(respones).to redirect_to('/welcome')
  end

  it 'displays featured sauce'
end
