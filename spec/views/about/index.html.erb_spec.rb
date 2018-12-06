# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/index', type: :view do
  it 'renders page content' do
    render
    expect(rendered).to have_selector('.about-page.container')
  end

  it 'renders ABOUT header' do
    render
    expect(rendered).to have_selector('.about-description h2', text: 'ABOUT')
  end

  it 'renders avatar' do
    render
    expect(rendered).to have_selector('.avatar')
  end

  it 'renders about description' do
    render
    expect(rendered).to have_selector('.about-description')
  end

end
