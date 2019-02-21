# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/edit', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#edit-review-page')
    end
  end

  context 'header' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#header', text: 'EDIT REVIEW')
    end
  end

  context 'form' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#review-form')
    end

    it 'user is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector("input[placeholder='User'][value='#{review.user}']")
    end

    it 'body is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#body', text: review.body)
    end

    it 'headline is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector("input[placeholder='Headline'][value='#{review.headline}']")
    end

    it 'rating is populated with existing value' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector("input[placeholder='Rating'][value='#{review.rating}']")
    end
  end
end
