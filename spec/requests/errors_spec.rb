# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'errors', type: :request do
  it 'responds with 404 if page not found' do
    expect { get '/hello' }.to raise_error(ActionController::RoutingError)
  end

  it 'renders 404 page' do
    get not_found_path
    expect(response.body).to have_selector('#not-found-page')
  end
end
