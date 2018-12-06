# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'errors', type: :request do
  it 'returns not found' do
    get '/404'
    expect(response).to have_http_status(:not_found)
  end

  it 'render not found page' do
    get '/404'
    expect(response.body).to have_selector('.not-found-page.container')
  end
end
