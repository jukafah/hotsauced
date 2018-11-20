# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'renders page content' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('.home-page-content', count: 1)
  end

  it 'renders banner' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('.site-banner', count: 1)
  end

  it 'renders featured sauce' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    puts rendered
    expect(rendered).to have_selector('.featured-sauce .sauce.card')
  end
end
