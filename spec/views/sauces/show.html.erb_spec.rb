# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/show', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#sauce-display-page')
    end
  end

  context 'image' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#image')
    end
  end

  context 'name' do
    it 'displays text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#name', text: sauce.name)
    end
  end

  context 'description' do
    it 'displays single paragraph' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#description p', count: 1)
    end

    it 'displays multiple paragraphs' do
      description = "First Paragraph.\n\nSecond Paragraph."
      sauce = FactoryBot.create(:sauce, description: description)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#description p', count: 2)
    end
  end

  context 'pepper' do
    it 'displays label' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#pepper h4', text: 'Pepper')
    end

    it 'displays text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#pepper p', text: sauce.pepper)
    end
  end

  context 'brand' do
    it 'displays label' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#brand h4', text: 'Brand')
    end

    it 'displays text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#brand p', text: sauce.brand)
    end
  end

  context 'ingredients' do
    it 'displays label' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#ingredients h4', text: 'Ingredients')
    end

    it 'displays text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#ingredients p', text: sauce.ingredients)
    end
  end

  context 'origin' do
    it 'displays label' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#origin h4', text: 'Origin')
    end

    it 'displays text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#origin p', text: sauce.origin)
    end
  end

  context 'rating overview' do
    context 'when reviews exist' do
      it 'renders rating bottle' do
        sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: sauce)
        assign(:sauce, sauce)
        render
        expect(rendered).to have_selector('#rating-overview #rating-bottle')
      end

      it 'renders numerical average rating' do
        sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: sauce)
        assign(:sauce, sauce)
        render
        expect(rendered).to have_selector('#rating-overview #average-rating', text: sauce.average_rating)
      end
    end

    context 'when reviews do not exist' do
      it 'does not render rating overview' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        render
        expect(rendered).to_not have_selector('#rating-overview')
      end
    end
  end

  context 'reviews section' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#reviews-section')
    end

    it 'renders header' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#reviews-section h3', text: 'Reviews')
    end
  end
end
