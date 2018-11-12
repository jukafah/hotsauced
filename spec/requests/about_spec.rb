# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /about', type: :request do
  it 'returns successfully' do
    get '/about'
    expect(response).to have_http_status(200)
  end

  it 'about link active' do
    get '/about'
    expect(response.body).to have_selector('.nav-link.active', text: 'ABOUT')
  end
end
