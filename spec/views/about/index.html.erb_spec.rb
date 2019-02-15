# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/index', type: :view do
  it 'renders heat statement'
  it 'renders flavor statement'
  it 'renders peppers statement'
  it 'renders sauce statement'
  it 'renders avatar'
  it 'renders DEVLOPED BY'
  it 'renders Steve Momcilovic'
  it 'renders page content' do
    render
    expect(rendered).to have_selector('#about-page')
  end

  it 'renders avatar' do
    render
    expect(rendered).to have_selector('#avatar')
  end
end
