# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sauce', type: :model do
  context 'can be saved when when' do
    it 'all required parameters exist' do
      sauce = FactoryBot.build(:sauce)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'name' do
    context 'valid when' do
      it 'minimum of 1 characters' do
        sauce = FactoryBot.build(:sauce, name: 'A')
        result = sauce.save
        expect(result).to be true
      end

      it 'maximum of 128 characters' do
        name = 'a' * 128
        sauce = FactoryBot.build(:sauce, name: name)
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.build(:sauce, name: nil)
        result = sauce.save
        expect(result).to be false
      end

      it 'not unique' do
        FactoryBot.create(:sauce, name: 'same name')
        sauce = FactoryBot.build(:sauce, name: 'same name')
        result = sauce.save
        expect(result).to be false
      end

      it 'less than 1 character' do
        sauce = FactoryBot.build(:sauce, name: '')
        result = sauce.save
        expect(result).to be false
      end

      it 'greater than 128 characters' do
        name = 'a' * 129
        sauce = FactoryBot.build(:sauce, name: name)
        result = sauce.save
        expect(result).to be false
      end
    end
  end

  context 'description' do
    context 'valid when' do
      it 'minimum of 12 characters' do
        description = 'a' * 12
        sauce = FactoryBot.build(:sauce, description: description)
        result = sauce.save
        expect(result).to be true
      end

      it 'maximum of 2500 characters' do
        description = 'a' * 2500
        sauce = FactoryBot.build(:sauce, description: description)
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.build(:sauce, description: nil)
        result = sauce.save
        expect(result).to be false
      end

      it 'less than 12 characters' do
        description = 'a' * 11
        sauce = FactoryBot.build(:sauce, description: description)
        result = sauce.save
        expect(result).to be false
      end

      it 'greater than 2500 characters' do
        description = 'a' * 2501
        sauce = FactoryBot.build(:sauce, description: description)
        result = sauce.save
        expect(result).to be false
      end
    end
  end

  context 'pepper' do
    context 'valid when' do
      it 'minimum of 2 characters' do
        pepper = 'a' * 2
        sauce = FactoryBot.build(:sauce, pepper: pepper)
        result = sauce.save
        expect(result).to be true
      end

      it 'maximum of 64 characters' do
        pepper = 'a' * 64
        sauce = FactoryBot.build(:sauce, pepper: pepper)
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.build(:sauce, pepper: nil)
        result = sauce.save
        expect(result).to be false
      end

      it 'less than 2 characters' do
        pepper = 'a' * 1
        sauce = FactoryBot.build(:sauce, pepper: pepper)
        result = sauce.save
        expect(result).to be false
      end

      it 'greater than 64 characters' do
        pepper = 'a' * 65
        sauce = FactoryBot.build(:sauce, pepper: pepper)
        result = sauce.save
        expect(result).to be false
      end
    end
  end

  context 'ingredients' do
    context 'valid when' do
      it 'minimum of 4 characters' do
        ingredients = 'a' * 4
        sauce = FactoryBot.build(:sauce, ingredients: ingredients)
        result = sauce.save
        expect(result).to be true
      end

      it 'maximum of 500 characters' do
        ingredients = 'a' * 500
        sauce = FactoryBot.build(:sauce, ingredients: ingredients)
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.build(:sauce, ingredients: nil)
        result = sauce.save
        expect(result).to be false
      end

      it 'less than 4 characters' do
        ingredients = 'a' * 3
        sauce = FactoryBot.build(:sauce, ingredients: ingredients)
        result = sauce.save
        expect(result).to be false
      end

      it 'greater than 500 characters' do
        ingredients = 'a' * 501
        sauce = FactoryBot.build(:sauce, ingredients: ingredients)
        result = sauce.save
        expect(result).to be false
      end
    end
  end

  context 'brand' do
    context 'valid when' do
      it 'minimum of 2 characters' do
        brand = 'a' * 2
        sauce = FactoryBot.build(:sauce, brand: brand)
        result = sauce.save
        expect(result).to be true
      end

      it 'maximum of 64 characters' do
        brand = 'a' * 64
        sauce = FactoryBot.build(:sauce, brand: brand)
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.build(:sauce, brand: nil)
        result = sauce.save
        expect(result).to be false
      end

      it 'less than 2 characters' do
        brand = 'a' * 1
        sauce = FactoryBot.build(:sauce, brand: brand)
        result = sauce.save
        expect(result).to be false
      end

      it 'greater than 64 characters' do
        brand = 'a' * 65
        sauce = FactoryBot.build(:sauce, brand: brand)
        result = sauce.save
        expect(result).to be false
      end
    end
  end

  context 'origin' do
    context 'valid when' do
      it 'minimum of 2 characters' do
        origin = 'a' * 2
        sauce = FactoryBot.build(:sauce, origin: origin)
        result = sauce.save
        expect(result).to be true
      end

      it 'maximum of 64 characters' do
        origin = 'a' * 64
        sauce = FactoryBot.build(:sauce, origin: origin)
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'invalid when' do
      it 'does not exist' do
        sauce = FactoryBot.build(:sauce, origin: nil)
        result = sauce.save
        expect(result).to be false
      end

      it 'less than 2 characters' do
        origin = 'a' * 1
        sauce = FactoryBot.build(:sauce, origin: origin)
        result = sauce.save
        expect(result).to be false
      end

      it 'greater than 64 characters' do
        origin = 'a' * 65
        sauce = FactoryBot.build(:sauce, origin: origin)
        result = sauce.save
        expect(result).to be false
      end
    end
  end

  context 'reviews' do
    context 'submission' do
      it 'can submit one' do
        review = FactoryBot.build(:review)
        sauce = FactoryBot.build(:sauce, reviews: [review])
        result = sauce.save
        expect(result).to be true
      end

      it 'can submit multiple' do
        review_one = FactoryBot.build(:review)
        review_two = FactoryBot.build(:review, user: 'Different User')
        sauce = FactoryBot.build(:sauce, reviews: [review_one, review_two])
        result = sauce.save
        expect(result).to be true
      end
    end

    context 'when reviews exist' do
      it 'can get average rating of a sauce' do
        review_list = FactoryBot.build_list(:review, 10)
        sauce = FactoryBot.create(:sauce, reviews: review_list)
        expected_average = sauce.reviews.average(:rating)
        expect(sauce.average_rating).to eq(expected_average)
      end
      it 'can get only sauces that have been reviewed' do
        FactoryBot.create(:sauce)
        reviewed_sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: reviewed_sauce)
        expect(Sauce.reviewed).to contain_exactly(reviewed_sauce)
      end
    end
  end
end
