require 'rails_helper'

RSpec.describe 'contact', type: :request do

  it 'GET page' do
    get '/contact'
    expect(response).to have_http_status(:ok)
  end

end
