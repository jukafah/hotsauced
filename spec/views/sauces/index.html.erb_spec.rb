# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/index', type: :view do
  context 'template' do
    it 'renders' do
      sauces = FactoryBot.create_list(:sauce, 2)
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#sauces-page')
    end
  end

  context 'when found' do
    it 'renders as list' do
      sauces = FactoryBot.create_list(:sauce, 2)
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card', count: 2)
    end
  end

  context 'when not found' do
    it 'renders no results' do
      sauces = FactoryBot.create_list(:sauce, 2)
      sauces.clear
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#no-results')
    end
  end

  context 'add new button' do
    it 'displays text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauces, [sauce])
      render
      expect(rendered).to have_selector(:link_or_button, 'ADD NEW SAUCE')
    end
  end
end
