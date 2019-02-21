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

    it 'renders error' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      review.save
      assign(:review, review)
      render
      expect(rendered).to have_selector('#user + .invalid-feedback', text: "User can't be blank and is too short (minimum is 1 character).")
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

    it 'renders error' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      review.save
      assign(:review, review)
      render
      expect(rendered).to have_selector('#rating + .invalid-feedback', text: "Rating can't be blank and is not a number.")
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

    it 'renders error' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      review.save
      assign(:review, review)
      render
      expect(rendered).to have_selector('#headline + .invalid-feedback', text: "Headline can't be blank and is too short (minimum is 2 characters).")
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

    it 'renders error' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = Review.new
      review.save
      assign(:review, review)
      render
      expect(rendered).to have_selector('#body + .invalid-feedback', text: "Body can't be blank and is too short (minimum is 2 characters).")
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
