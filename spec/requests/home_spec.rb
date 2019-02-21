# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  it 'root redirects to /home' do
    get root_path
    expect(response).to redirect_to(home_path)
  end

  it '/home responds with 200' do
    get home_path
    expect(response).to have_http_status(:ok)
  end
end
