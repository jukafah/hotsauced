# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sauce, type: :model do
  it 'can be saved' do
    sauce = FactoryBot.build(:sauce)
    result = sauce.save
    expect(result).to be true
  end

  context 'Name' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, name: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be unique' do
      FactoryBot.create(:sauce)
      sauce = FactoryBot.build(:sauce)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 1 character' do
      sauce = FactoryBot.build(:sauce, name: '')
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a minimum of 1 characters' do
      sauce = FactoryBot.build(:sauce, name: 'A')
      result = sauce.save
      expect(result).to be true
    end

    it 'must be a maximum of 128 characters' do
      name = 'a' * 128
      sauce = FactoryBot.build(:sauce, name: name)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 128 characters' do
      name = 'a' * 129
      sauce = FactoryBot.build(:sauce, name: name)
      result = sauce.save
      expect(result).to be false
    end
  end

  context 'Description' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, description: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 12 characters' do
      description = 'a' * 11
      sauce = FactoryBot.build(:sauce, description: description)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a minimum of 12 characters' do
      description = 'a' * 12
      sauce = FactoryBot.build(:sauce, description: description)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 2500 characters' do
      description = 'a' * 2501
      sauce = FactoryBot.build(:sauce, description: description)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a maximum of 2500 characters' do
      description = 'a' * 2500
      sauce = FactoryBot.build(:sauce, description: description)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Pepper' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, pepper: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 2 characters' do
      pepper = 'a'*1
      sauce = FactoryBot.build(:sauce, pepper: pepper)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a minimum of 2 characters' do
      pepper = 'a'*2
      sauce = FactoryBot.build(:sauce, pepper: pepper)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 64 characters' do
      pepper = 'a'*65
      sauce = FactoryBot.build(:sauce, pepper: pepper)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a maximum of 64 characters' do
      pepper = 'a'*64
      sauce = FactoryBot.build(:sauce, pepper: pepper)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Ingredients' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, ingredients: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 4 characters' do
      ingredients = 'a'*3
      sauce = FactoryBot.build(:sauce, ingredients: ingredients)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a minimum of 4 characters' do
      ingredients = 'a'*4
      sauce = FactoryBot.build(:sauce, ingredients: ingredients)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 500 characters' do
      ingredients = 'a'*501
      sauce = FactoryBot.build(:sauce, ingredients: ingredients)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a maximum of 500 characters' do
      ingredients = 'a'*500
      sauce = FactoryBot.build(:sauce, ingredients: ingredients)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Brand' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, brand: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 2 characters' do
      brand = 'a'*1
      sauce = FactoryBot.build(:sauce, brand: brand)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a minimum of 2 characters' do
      brand = 'a'*2
      sauce = FactoryBot.build(:sauce, brand: brand)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 64 characters' do
      brand = 'a'*65
      sauce = FactoryBot.build(:sauce, brand: brand)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a maximum of 64 characters' do
      brand = 'a'*64
      sauce = FactoryBot.build(:sauce, brand: brand)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Origin' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, origin: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 2 characters' do
      origin = 'a'*1
      sauce = FactoryBot.build(:sauce, origin: origin)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a minimum of 2 characters' do
      origin = 'a'*2
      sauce = FactoryBot.build(:sauce, origin: origin)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 64 characters' do
      origin = 'a'*65
      sauce = FactoryBot.build(:sauce, origin: origin)
      result = sauce.save
      expect(result).to be false
    end

    it 'can be a maximum of 64 characters' do
      origin = 'a'*64
      sauce = FactoryBot.build(:sauce, origin: origin)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Reviews' do
    it 'reviews do not need to exist' do
      sauce = FactoryBot.build(:sauce, reviews: [])
      result = sauce.save
      expect(result).to be true
    end

    it 'reviews can be submit' do
      review = FactoryBot.build(:review)
      sauce = FactoryBot.build(:sauce, reviews: [review])
      result = sauce.save
      expect(result).to be true
    end
  end
end
