# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contact', type: :model do

  context 'is valid when' do
    it 'all required parameters exist' do
      contact = FactoryBot.build(:contact)
      valid = contact.valid?
      expect(valid).to be true
    end
  end
  
  context 'is invalid when' do
    it 'has no email' do
      contact = FactoryBot.build(:contact, email: nil)
      valid = contact.valid?
      expect(valid).to be false
    end

    it 'has no name' do
      contact = FactoryBot.build(:contact, name: nil)
      valid = contact.valid?
      expect(valid).to be false
    end

    it 'has no body' do
      contact = FactoryBot.build(:contact, body: nil)
      valid = contact.valid?
      expect(valid).to be false
    end
  end
end
