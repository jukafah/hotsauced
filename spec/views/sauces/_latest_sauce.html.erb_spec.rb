# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_latest_sauce', type: :view do
  context 'when exists' do
    context 'name' do
      it 'renders text' do
        sauce = FactoryBot.create(:sauce)
        assign(:latest_sauce, sauce)
        render
        expect(rendered).to have_selector('#name', text: sauce.name)
      end

      it 'renders as link' do
        sauce = FactoryBot.create(:sauce)
        assign(:latest_sauce, sauce)
        render
        expect(rendered).to have_link(sauce.name)
      end
    end

    context 'description' do
      it 'renders single paragraph' do
        sauce = FactoryBot.create(:sauce)
        assign(:latest_sauce, sauce)
        render
        expect(rendered).to have_selector('#description p', count: 1)
      end

      it 'renders multiple paragraphs' do
        description = "First Paragraph.\n\nSecond Paragraph."
        sauce = FactoryBot.create(:sauce, description: description)
        assign(:latest_sauce, sauce)
        render
        expect(rendered).to have_selector('#description p', count: 2)
      end
    end
  end
end
