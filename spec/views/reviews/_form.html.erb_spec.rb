# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/_form', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#review-form')
    end
  end

  context 'user' do
    it 'renders control' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#user')
    end

    it 'render placeholder text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector("input[placeholder='User']")
    end
  end

  context 'rating' do
    it 'renders control' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#rating')
    end

    it 'renders placeholder text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector("input[placeholder='Rating']")
    end
  end

  context 'headline' do
    it 'renders control' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#headline')
    end

    it 'renders placeholder text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector("input[placeholder='Headline']")
    end
  end

  context 'body' do
    it 'renders control' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#body')
    end

    it 'renders placeholder text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector("textarea[placeholder='Tell us what you think...']")
    end
  end

  context 'submit' do
    it 'renders control' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_selector('#submit-form')
    end

    it 'renders as button' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      assign(:review, review)
      render
      expect(rendered).to have_button('Submit')
    end
  end
end
