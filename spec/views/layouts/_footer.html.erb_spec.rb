# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_footer', type: :view do
  it 'renders' do
    render
    expect(rendered).to have_selector('.footer', count: 1)
  end

  it 'contains copyright' do
    render
    expect(rendered).to have_selector('.text-muted', text: 'Copyright © 2019 HOT SAUCED')
  end
end
