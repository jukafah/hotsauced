# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'errors/not_found.html.erb', type: :view do
  context 'template' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#not-found-page')
    end
  end

  context 'header' do
    it 'renders text' do
      render
      expect(rendered).to have_selector('#alert-heading', text: 'Not Found!')
    end
  end

  context 'description' do
    it 'renders description' do
      render
      expect(rendered).to have_selector('#description', text: 'The requested page does not exist.')
    end
  end
end
