# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/edit', type: :view do
  it 'renders page content' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.edit-sauce-page-content')
  end

  it 'renders EDIT SAUCE header' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.edit-sauce-page-content h2', count: 1, text: 'EDIT SAUCE')
  end

  it 'renders form' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-form')
  end
end
