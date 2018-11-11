# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sauce, type: :model do
  it 'can be saved' do
    sauce = FactoryBot.build(:sauce)
    result = sauce.save
    expect(result).to be true
  end
  # test should be 'greater than n' characters
  # test should be 'less than n' characters
  # change name minimum to 1 character

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

  context 'Summary' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, summary: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 12 characters' do
      summary = 'a' * 11
      sauce = FactoryBot.build(:sauce, summary: summary)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a minimum of 12 characters' do
      summary = 'a' * 12
      sauce = FactoryBot.build(:sauce, summary: summary)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 1000 characters' do
      summary = 'a' * 1001
      sauce = FactoryBot.build(:sauce, summary: summary)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a maximum of 1000 characters' do
      summary = 'a' * 1000
      sauce = FactoryBot.build(:sauce, summary: summary)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Heat' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, heat: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 0' do
      sauce = FactoryBot.build(:sauce, heat: -1)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be minimum of 0' do
      sauce = FactoryBot.build(:sauce, heat: 0)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 5' do
      sauce = FactoryBot.build(:sauce, heat: 6)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be maximum of 5' do
      sauce = FactoryBot.build(:sauce, heat: 5)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Flavor' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, flavor: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be less than 0' do
      sauce = FactoryBot.build(:sauce, flavor: -1)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a minimum of 0' do
      sauce = FactoryBot.build(:sauce, flavor: 0)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be greater than 5' do
      sauce = FactoryBot.build(:sauce, flavor: 6)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be a maximum of 5' do
      sauce = FactoryBot.build(:sauce, flavor: 5)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Rating' do
    it 'must exist' do
      sauce = FactoryBot.build(:sauce, rating: nil)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be minimum of 0' do
      sauce = FactoryBot.build(:sauce, rating: 0)
      result = sauce.save
      expect(result).to be true
    end

    it 'must not be lower than 0' do
      sauce = FactoryBot.build(:sauce, rating: -1)
      result = sauce.save
      expect(result).to be false
    end

    it 'must not be greater than 5' do
      sauce = FactoryBot.build(:sauce, rating: 6)
      result = sauce.save
      expect(result).to be false
    end

    it 'must be maximum of 5' do
      sauce = FactoryBot.build(:sauce, rating: 5)
      result = sauce.save
      expect(result).to be true
    end
  end

  context 'Comments' do
    it 'comments must not need to exist' do
      sauce = FactoryBot.build(:sauce, comments: [])
      result = sauce.save
      expect(result).to be true
    end

    it 'comments can be submit' do
      comment = FactoryBot.build(:comment)
      sauce = FactoryBot.build(:sauce, comments: [comment])
      result = sauce.save
      expect(result).to be true
    end
  end
end
