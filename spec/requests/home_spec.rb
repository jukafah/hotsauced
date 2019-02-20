# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :request do
  it 'root redirects to /home' do
    get root_path
    expect(response).to redirect_to(home_path)
  end

  it 'test' do
    FactoryBot.create_list(:sauce, 6)
    get home_path format: :json
    puts response
    puts response.body
  end

  #TODO: needs to be here to successfully limit and also provide order
  # it 'is limited to 5' do
  #   sauces = FactoryBot.create_list(:sauce, 6)
  #   assign(:top_sauces, sauces)
  #   render
  #   expect(rendered).to have_selector('#top-sauce-list #top-sauce', count: 5)
  # end
  it 'is in descending order by rating'
end
