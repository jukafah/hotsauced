# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/new', type: :view do
  it 'renders page content' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.new-sauce-page.container')
  end

  it 'renders ADD NEW SAUCE header' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.new-sauce-page-content h2', text: 'ADD NEW SAUCE', count: 1)
  end

  it 'renders form' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-form')
  end
end
