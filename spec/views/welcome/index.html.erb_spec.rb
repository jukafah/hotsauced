# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'welcome/index', type: :view do
  it 'renders' do
    render
    expect(rendered).to have_selector('.welcome-page-content', count: 1)
  end

  it 'renders with correct title' do
    render
    expect(rendered).to have_selector('title', text: 'Welcome')
  end

  it 'renders the banner' do
    render
    expect(rendered).to have_selector('.page-banner', count: 1)
  end
end
