# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'errors/not_found.html.erb', type: :view do
  it 'renders not found header' do
    render
    expect(rendered).to have_selector('.alert .alert-heading', text: 'Not Found!')
  end

  it 'renders description' do
    render
    expect(rendered).to have_selector('.alert p', text: 'The requested page does not exist.')
  end
end
