# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'can be created' do
    sauce = FactoryBot.create(:sauce)
    comment = FactoryBot.build(:comment, sauce: sauce)
    result = comment.save
    expect(result).to be true
  end

  it 'can be a list' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:comment, sauce: sauce)
    FactoryBot.create(:comment, sauce: sauce)
    expect(sauce.comments.count).to eq(2)
  end

  context 'User' do
    it 'name must exist' do
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, commenter: nil, sauce: sauce)
      result = comment.save
      expect(result).to be false
    end

    it 'name cannot be less than 1 character' do
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, commenter: '', sauce: sauce)
      result = comment.save
      expect(result).to be false
    end

    it 'name can be a minimum of 1 character' do
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, commenter: 'A', sauce: sauce)
      result = comment.save
      expect(result).to be true
    end

    it 'name cannot be more than 48 characters' do
      name = 'A' * 49
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, commenter: name, sauce: sauce)
      result = comment.save
      expect(result).to be false
    end

    it 'name can be a maximum of 48 characters' do
      name = 'A' * 48
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, commenter: name, sauce: sauce)
      result = comment.save
      expect(result).to be true
    end
  end

  context 'Body' do
    it 'body must exist' do
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, body: nil, sauce: sauce)
      result = comment.save
      expect(result).to be false
    end

    it 'body cannot be less than 2 characters' do
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, body: 'A', sauce: sauce)
      result = comment.save
      expect(result).to be false
    end

    it 'body can be minimum of 2 characters' do
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, body: 'Ab', sauce: sauce)
      result = comment.save
      expect(result).to be true
    end

    it 'body can be a maximum of 1000 characters' do
      body = 'A' * 1000
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, body: body, sauce: sauce)
      result = comment.save
      expect(result).to be true
    end

    it 'body cannot be greater than 1000 characters' do
      body = 'A' * 1001
      sauce = FactoryBot.create(:sauce)
      comment = FactoryBot.build(:comment, body: body, sauce: sauce)
      result = comment.save
      expect(result).to be false
    end
  end
end
