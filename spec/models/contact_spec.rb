require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'can be created'
  it 'is invalid without email'
  it 'is invalid without name'
  it 'is invalid without body'
end
