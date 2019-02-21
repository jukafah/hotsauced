require 'rails_helper'

RSpec.describe 'sauces/_sauces', type: :view do
  context 'sauce cards' do
    it 'render cards' do
      sauces = FactoryBot.create_list(:sauce, 10)
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card', count: 10)
    end
  end

  context 'name' do
    it 'renders text' do
      sauces = FactoryBot.create_list(:sauce, 5)
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card #name', count: 1, text: sauces[0].name)
    end

    it 'text truncates at 64 characters' do
      sauces = FactoryBot.create_list(:sauce, 5)
      sauces[0].name = 'a' * 65
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card #name', text: 'a' * 61 + '...' )
    end

    it 'renders as link' do
      sauces = FactoryBot.create_list(:sauce, 5)
      assign(:sauces, sauces)
      render
      expect(rendered).to have_link(sauces[0].name)
    end
  end

  context 'description' do
    it 'renders text' do
      sauces = FactoryBot.create_list(:sauce, 5)
      sauces[0].description = 'different description'
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card #description', count: 1, text: sauces[0].description)
    end

    it 'text truncates at 250 characters' do
      sauces = FactoryBot.create_list(:sauce, 5)
      sauces[0].description = 'a' * 251
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card #description', text: 'a' * 247 + '...')
    end
  end

  context 'image' do
    it 'renders' do
      sauces = FactoryBot.create_list(:sauce, 5)
      assign(:sauces, sauces)
      render
      expect(rendered).to have_selector('#card #image', count: 5)
    end
  end

  context 'rating' do
    context 'when exists' do
      it 'renders numerical average rating' do
        sauces = FactoryBot.create_list(:sauce, 1)
        FactoryBot.create(:review, sauce: sauces[0])
        assign(:sauces, sauces)
        render
        expect(rendered).to have_selector('#card #rating-info #average-rating')
      end

      it 'renders bottles' do
        sauces = FactoryBot.create_list(:sauce, 1)
        FactoryBot.create(:review, sauce: sauces[0])
        assign(:sauces, sauces)
        render
        expect(rendered).to have_selector('#card #rating-info #rating-bottle')
      end
    end

    context 'when not exists' do
      it 'does not render rating info' do
        sauces = FactoryBot.create_list(:sauce, 1)
        assign(:sauces, sauces)
        render
        expect(rendered).to_not have_selector('#card #rating-info')
      end
    end
  end
end
