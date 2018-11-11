# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'renders page content' do
    render
    expect(rendered).to have_selector('.home-page-content', count: 1)
  end

  it 'renders banner' do
    render
    expect(rendered).to have_selector('.site-banner', count: 1)
  end

  it 'renders featured sauce' do
    FactoryBot.create(:sauce)
    render
    expect(rendered).to have_selector('.featured-sauce')
  end
end
