# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'can be created' do
    contact = FactoryBot.build(:contact)
    valid = contact.valid?
    expect(valid).to be true
  end

  it 'is invalid without email' do
    contact = FactoryBot.build(:contact, email: nil)
    valid = contact.valid?
    expect(valid).to be false
  end

  it 'is invalid without name' do
    contact = FactoryBot.build(:contact, name: nil)
    valid = contact.valid?
    expect(valid).to be false
  end

  it 'is invalid without body' do
    contact = FactoryBot.build(:contact, body: nil)
    valid = contact.valid?
    expect(valid).to be false
  end
end
