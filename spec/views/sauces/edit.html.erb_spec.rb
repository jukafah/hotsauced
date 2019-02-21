# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/edit', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#edit-sauce-page')
    end
  end

  context 'header' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#header', text: 'EDIT SAUCE')
    end
  end

  context 'form' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#sauce-form')
    end

    it 'name is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Name'][value='#{sauce.name}']")
    end

    it 'description is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#description', text: sauce.description)
    end

    it 'pepper is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Pepper'][value='#{sauce.pepper}']")
    end

    it 'ingredients is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#ingredients', text: sauce.ingredients)
    end

    it 'brand is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Brand'][value='#{sauce.brand}']")
    end

    it 'origin is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Origin'][value='#{sauce.origin}']")
    end
  end
end
