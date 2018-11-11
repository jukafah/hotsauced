# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do

  it 'displays page content' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response.body).to have_selector('.home-page-content', count: 1)
  end

  it 'displays site banner' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response.body).to have_selector('.site-banner', count: 1)
  end

  it 'display with HOME active on navbar' do
    get '/'
    expect(response).to have_http_status(:ok)
    expect(response.body).to have_selector('home.nav-link.active', count: 1)
  end

  it 'root redirects to /welcome' do
    get '/'
    expect(response).to redirect_to('/welcome')
  end

  it 'displays featured sauce' do
    FactoryBot.create(:sauce)
    get '/'
    expect(response.body).to have_selector('.featured-sauce')
  end

  it 'featured sauce links to sauce display page' do
    sauce = FactoryBot.create(:sauce)
    get '/'
    expect(response.body).to have_link(sauce.name)
  end
end
