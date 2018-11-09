# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/index', type: :view do
  it 'renders page content' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce-page-content')
  end

  it 'renders with list of sauces' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce', count: 2)
  end

  it 'renders no results' do
    sauces = FactoryBot.create_list(:sauce, 2)
    sauces.clear
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.no-results', count: 1)
  end
end
