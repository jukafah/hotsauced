# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Review', type: :model do
  context 'can be saved when' do
    it 'all required parameters exist' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, sauce: sauce)
      result = review.save
      expect(result).to be true
    end
  end

  context 'headline' do
    context 'valid when' do
      it 'minimum of 2 characters' do
        sauce = FactoryBot.create(:sauce)
        headline = 'a' * 2
        review = FactoryBot.build(:review, sauce: sauce, headline: headline)
        result = review.save
        expect(result).to be true
      end

      it 'maximum of 64 characters' do
        sauce = FactoryBot.create(:sauce)
        headline = 'a' * 64
        review = FactoryBot.build(:review, sauce: sauce, headline: headline)
        result = review.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, sauce: sauce, headline: nil)
        result = review.save
        expect(result).to be false
      end

      it 'less than 2 characters' do
        sauce = FactoryBot.create(:sauce)
        headline = 'a' * 1
        review = FactoryBot.build(:review, sauce: sauce, headline: headline)
        result = review.save
        expect(result).to be false
      end

      it 'greater than 64 characters' do
        sauce = FactoryBot.create(:sauce)
        headline = 'a' * 65
        review = FactoryBot.build(:review, sauce: sauce, headline: headline)
        result = review.save
        expect(result).to be false
      end
    end
  end

  context 'user' do
    context 'valid when' do
      it 'maximum of 64 characters' do
        name = 'A' * 64
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, user: name, sauce: sauce)
        result = review.save
        expect(result).to be true
      end
      it 'minimum of 1 character' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, user: 'A', sauce: sauce)
        result = review.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'name does not exist' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, user: nil, sauce: sauce)
        result = review.save
        expect(result).to be false
      end

      it 'less than 1 character' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, user: '', sauce: sauce)
        result = review.save
        expect(result).to be false
      end

      it 'greater than than 64 characters' do
        name = 'A' * 65
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, user: name, sauce: sauce)
        result = review.save
        expect(result).to be false
      end
    end
  end

  context 'rating' do
    context 'valid when' do
      it 'maximum of 5' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, rating: 5, sauce: sauce)
        result = review.save
        expect(result).to be true
      end
      it 'minimum of 1' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, rating: 1, sauce: sauce)
        result = review.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, rating: nil, sauce: sauce)
        result = review.save
        expect(result).to be false
      end

      it 'less than 1' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, rating: 0, sauce: sauce)
        result = review.save
        expect(result).to be false
      end

      it 'greater than 5' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, rating: 6, sauce: sauce)
        result = review.save
        expect(result).to be false
      end
    end
  end

  context 'body' do
    context 'valid when' do
      it 'minimum of 2 characters' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, body: 'Ab', sauce: sauce)
        result = review.save
        expect(result).to be true
      end

      it 'maximum of 1250 characters' do
        body = 'A' * 1250
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, body: body, sauce: sauce)
        result = review.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, body: nil, sauce: sauce)
        result = review.save
        expect(result).to be false
      end

      it 'less than 2 characters' do
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, body: 'A', sauce: sauce)
        result = review.save
        expect(result).to be false
      end

      it 'greater than 1250 characters' do
        body = 'A' * 1251
        sauce = FactoryBot.create(:sauce)
        review = FactoryBot.build(:review, body: body, sauce: sauce)
        result = review.save
        expect(result).to be false
      end
    end
  end
end
