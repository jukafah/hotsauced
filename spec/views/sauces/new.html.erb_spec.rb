# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/new', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#new-sauce-page')
    end
  end

  context 'header' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#header', text: 'ADD NEW SAUCE')
    end
  end

  context 'form' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#sauce-form')
    end
  end
end
