# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/new', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#new-review-page')
    end
  end

  context 'header' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#header', text: 'ADD NEW REVIEW')
    end
  end

  context 'form' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#review-form')
    end
  end
end
