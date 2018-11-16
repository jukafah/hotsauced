# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/index', type: :view do
  it 'renders page content' do
    render
    expect('.about-page-content')
  end

  it 'renders mini nav bar' do
    render
    expect(rendered).to have_selector('.nav')
  end

  it 'renders about link' do
    render
    expect(rendered).to have_selector('.about-section')
  end

  it 'renders contact link' do
    render
    expect(rendered).to have_selector('.contact-section')
  end

end
