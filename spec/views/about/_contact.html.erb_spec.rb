# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/_contact', type: :view do
  it 'renders contact section' do
    render
    expect(rendered).to have_selector('.contact-section')
  end

  it 'renders CONTACT header' do
    render
    expect(rendered).to have_selector('.contact section h2', text: 'CONTACT')
  end

  it 'renders contact form' do
    render
    expect(rendered).to have_selector('.contact-form')
  end

  it 'renders name' do
    render
    expect(rendered).to have_selector('.contact-name')
  end

  it 'renders email' do
    render
    expect(rendered).to have_selector('.contact-email')
  end

  it 'renders message' do
    render
    expect(rendered).to have_selector('.contact-message')
  end

  it 'renders submit button' do
    render
    expect(rendered).to have_selector('.submit-button')
  end
end
