# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/_reviews', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      review = FactoryBot.create(:review, sauce: sauce)
      assign(:review, review)
      render
      expect(rendered).to have_selector('#reviews-section')
    end
  end

  context 'rating overview' do
    context 'rating average' do
      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #rating-bottles')
      end

      it 'renders average rating' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #average-rating')
      end

      it 'number of reviews is a link' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview a#number-of-reviews')
      end
    end

    context '5 bottle rating' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #5-rating-summary')
      end

      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #5-rating-summary #rating-bottles')
      end

      it 'renders percentage' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #5-rating-summary #percent-of-reviews')
      end
    end

    context '4 bottle rating' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #4-rating-summary')
      end

      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #4-rating-summary #rating-bottles')
      end

      it 'renders percentage' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #4-rating-summary #percent-of-reviews')
      end
    end

    context '3 bottle rating' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #3-rating-summary')
      end

      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #3-rating-summary #rating-bottles')
      end

      it 'renders percentage' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #3-rating-summary #percent-of-reviews')
      end
    end

    context '2 bottle rating' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #2-rating-summary')
      end

      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #2-rating-summary #rating-bottles')
      end

      it 'renders percentage' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #2-rating-summary #percent-of-reviews')
      end
    end

    context '1 bottle rating' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #1-rating-summary')
      end

      it 'renders rating bottles' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #1-rating-summary #rating-bottles')
      end

      it 'renders percentage' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #1-rating-summary #percent-of-reviews')
      end
    end

    context 'call to action' do
      it 'renders write a review' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#rating-overview #new-review')
      end
    end
  end

  context 'reviews' do
    context 'single review' do
      it 'renders' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#reviews #review', count: 1)
      end

      it 'renders text showing x of x' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#reviews #now-showing', text: 'Showing x of x')
      end
    end

    context 'multiple reviews' do
      it 'renders' do
        reviews = FactoryBot.build_list(:review, 2)
        sauce = FactoryBot.create(:sauce, reviews: reviews)
        assign(:sauce, sauce)
        render
        expect(rendered).to have_selector('#reviews #review', count: 2)
      end

      it 'renders text showing x of x' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#reviews #now-showing', text: 'Showing x of x')
      end
    end

    context 'card' do
      it 'renders user' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#review #user', text: review.user)
      end

      it 'renders headline as link' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_link(review.headline)
      end

      it 'renders rating' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#review #rating-bottles')
      end

      it 'renders body' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#review #body', text: review.body)
      end

      it 'renders date in %B %d/%Y' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#review #date', text: review.created_at.strftime('%B %d/%Y'))
      end

      it 'renders edit link' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#review a#edit-review', text: 'Edit')
      end

      it 'renders delete link' do
        sauce = FactoryBot.create(:sauce)
        assign(:sauce, sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        assign(:review, review)
        render
        expect(rendered).to have_selector('#review a#delete', text: 'Delete')
      end
    end
  end
end
