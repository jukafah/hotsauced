# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/index', type: :view do
  it 'renders page content' do
    render
    expect('.about-page-content')
  end

  it 'renders avatar' do
    render
    expect(rendered).to have_selector('.avatar')
  end

  it 'renders about section' do
    render
    expect(rendered).to have_selector('.about-section')
  end

  it 'renders contact section' do
    render
    expect(rendered).to have_selector('.contact-section')
  end
end
