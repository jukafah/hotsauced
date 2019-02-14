# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'can be created' do
    sauce = FactoryBot.create(:sauce)
    review = FactoryBot.build(:review, sauce: sauce)
    result = review.save
    expect(result).to be true
  end

  it 'can be a list' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:review, sauce: sauce)
    FactoryBot.create(:review, sauce: sauce)
    expect(sauce.reviews.count).to eq(2)
  end

  context 'Headline' do
    it 'headline must exist' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, sauce: sauce, headline: nil)
      result = review.save
      expect(result).to be false
    end

    it 'cannot be less than 2 characters' do
      sauce = FactoryBot.create(:sauce)
      headline = 'a' * 1
      review = FactoryBot.build(:review, sauce: sauce, headline: headline)
      result = review.save
      expect(result).to be false
    end

    it 'cannot be greater than 64 characters' do
      sauce = FactoryBot.create(:sauce)
      headline = 'a' * 65
      review = FactoryBot.build(:review, sauce: sauce, headline: headline)
      result = review.save
      expect(result).to be false
    end

    it 'can be a minimum of 2 characters' do
      sauce = FactoryBot.create(:sauce)
      headline = 'a' * 2
      review = FactoryBot.build(:review, sauce: sauce, headline: headline)
      result = review.save
      expect(result).to be true
    end

    it 'can be a maximum of 64 characters' do
      sauce = FactoryBot.create(:sauce)
      headline = 'a' * 64
      review = FactoryBot.build(:review, sauce: sauce, headline: headline)
      result = review.save
      expect(result).to be true
    end
  end

  context 'User' do
    it 'name must exist' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, user: nil, sauce: sauce)
      result = review.save
      expect(result).to be false
    end

    it 'name cannot be less than 1 character' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, user: '', sauce: sauce)
      result = review.save
      expect(result).to be false
    end

    it 'name can be a minimum of 1 character' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, user: 'A', sauce: sauce)
      result = review.save
      expect(result).to be true
    end

    it 'name cannot be more than 64 characters' do
      name = 'A' * 65
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, user: name, sauce: sauce)
      result = review.save
      expect(result).to be false
    end

    it 'name can be a maximum of 64 characters' do
      name = 'A' * 64
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, user: name, sauce: sauce)
      result = review.save
      expect(result).to be true
    end
  end

  context 'Rating' do
    it 'rating must exist' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, rating: nil, sauce: sauce)
      result = review.save
      expect(result).to be false
    end
    
    it 'rating cannot be less than 1' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, rating: 0, sauce: sauce)
      result = review.save
      expect(result).to be false
    end

    it 'rating can be maximum of 5' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, rating: 5, sauce: sauce)
      result = review.save
      expect(result).to be true
    end

    it 'rating cannot be more than 5' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, rating: 6, sauce: sauce)
      result = review.save
      expect(result).to be false
    end
  end

  context 'Body' do
    it 'body must exist' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, body: nil, sauce: sauce)
      result = review.save
      expect(result).to be false
    end

    it 'body cannot be less than 2 characters' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, body: 'A', sauce: sauce)
      result = review.save
      expect(result).to be false
    end

    it 'body can be minimum of 2 characters' do
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, body: 'Ab', sauce: sauce)
      result = review.save
      expect(result).to be true
    end

    it 'body can be a maximum of 1000 characters' do
      body = 'A' * 1000
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, body: body, sauce: sauce)
      result = review.save
      expect(result).to be true
    end

    it 'body cannot be greater than 1250 characters' do
      body = 'A' * 1251
      sauce = FactoryBot.create(:sauce)
      review = FactoryBot.build(:review, body: body, sauce: sauce)
      result = review.save
      expect(result).to be false
    end
  end
end
