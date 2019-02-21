# frozen_string_litera: true

require 'rails_helper'

RSpec.describe 'reviews/show', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#review-display-page')
    end
  end

  context 'header' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#header', text: 'REVIEW')
    end
  end

  context 'headline' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#headline', text: review.headline)
    end
  end

  context 'body' do
    it 'renders single paragraph text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#body p', text: review.body)
    end

    it 'renders multiple paragraph text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      review.body = "First Line.\n\nSecond Line."
      assign(:review, review)
      render
      expect(rendered).to have_selector('#body p', count: 2)
    end
  end

  context 'rating' do
    it 'renders rating bottles' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#review #rating-info #rating-bottles')
    end
  end

  context 'user' do
    it 'renders user' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#user', text: review.user)
    end
  end

  context 'sauce' do
    context 'name' do
      it 'renders text' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#sauce #name', text: sauce.name)
      end

      it 'renders as link' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_link(sauce.name)
      end
    end

    context 'image' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#sauce #image')
      end
    end

    context 'average rating info' do
      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#sauce #rating-info #rating-bottles')
      end

      it 'renders numerical average rating' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#sauce #rating-info #average-rating', text: "#{sauce.average_rating} out of 5" )
      end

      it 'renders singular text with one review' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#sauce #rating-info #average-rating', text: "#{sauce.reviews.count} review")
      end

      it 'renders plural text with one review' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        FactoryBot.create(:review, sauce:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#sauce #rating-info #average-rating', text: "#{sauce.reviews.count} reviews")
      end
    end
  end
end
