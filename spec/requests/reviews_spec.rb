# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do
  context 'reviews listing' do
    context 'when reviews for a sauce exist' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        get sauce_reviews_path(sauce)
        expect(response).to have_http_status(:ok)
      end
    end

    context' when reviews for a sauce do not exist' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        get sauce_reviews_path(sauce)
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'review display page' do
    context 'when resource is found' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        get sauce_review_path(sauce, review)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when resource is not found' do
      it 'raises record not found' do
        sauce = FactoryBot.create(:sauce)
        expect { get sauce_review_path(sauce, id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'submitting a new review' do
    context 'when resource is found' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        get new_sauce_review_path(sauce)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when sauce is not found' do
      it 'it raises record not found' do
        expect { get new_sauce_review_path(sauce_id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'with valid parameters' do
      it 'review is created and redirects to sauce display page' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build_stubbed(:review)
        post sauce_reviews_path(sauce), params: { review: review.attributes }
        expect(response).to redirect_to(sauce_path(sauce))
      end
    end

    context 'by different users on same sauce' do
      it 'creates successfully' do
        sauce = FactoryBot.create(:sauce)
        review_one = FactoryBot.build_stubbed(:review)
        review_two = FactoryBot.build_stubbed(:review, user: 'different user')
        post sauce_reviews_path(sauce), params: { review: review_one.attributes }
        expect(response).to redirect_to(sauce_path(sauce))
        post sauce_reviews_path(sauce), params: { review: review_two.attributes }
        expect(response).to redirect_to(sauce_path(sauce))
      end
    end

    context 'with invalid attributes' do
      it 'responds with 422' do
        sauce = FactoryBot.create(:sauce)
        post sauce_reviews_path(sauce), params: { review: { headline: 'A' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when submitting duplicate review by same user' do
      it 'responds with 422' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        duplicate_review = FactoryBot.build_stubbed(:review)
        post sauce_reviews_path(sauce), params: { review: duplicate_review.attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when review parameters are missing' do
      it 'raises parameter missing' do
        sauce = FactoryBot.create(:sauce)
        expect { post sauce_reviews_path(sauce), params: {} }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  context 'updating a review' do
    context 'when resource is found' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        get edit_sauce_review_path(sauce, review)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when resource is not found' do
      it 'raises record not found' do
        sauce = FactoryBot.create(:sauce)
        expect { get edit_sauce_review_path(sauce, id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when updated with valid parameter' do
      it 'redirects to sauce display page' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        patch sauce_review_path(sauce, review), params: { review: { body: 'A new body' } }
        expect(response).to redirect_to(sauce_path(sauce))
      end
    end

    context 'when updated with invalid parameter' do
      it 'responds with 422' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        patch sauce_review_path(sauce, review), params: { review: { body: 'A' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when updating name' do
      it 'responds with 422' do
        expect_any_instance_of(Review).not_to receive(:update).with(user: 'new')
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        patch sauce_review_path(sauce, review), params: { review: { user: 'new', rating: 1, headline: 'new', body: 'new',  } }
      end
    end
  end

  context 'deleting a review' do
    context 'when resource found' do
      it 'deletes from database' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.create(:review, sauce: sauce)
        delete sauce_review_path(sauce, review)
        expect(response).to redirect_to(sauce_path(sauce))
        expect { get sauce_review_path(sauce, review) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when resource not found' do
      it 'raises record not found' do
        sauce = FactoryBot.create(:sauce)
        expect { get sauce_review_path(sauce, id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
