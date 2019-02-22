# frozen string literal: true

require 'rails_helper'

RSpec.describe 'reviews/index', type: :view do

  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#sauce-reviews-display-page')
    end
  end

  context 'header' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#header', text: 'REVIEWS')
    end
  end

  context 'reviews section' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#reviews-section')
    end
  end
end
