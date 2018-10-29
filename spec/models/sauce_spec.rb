require 'rails_helper'

RSpec.describe Sauce, type: :model do

  it "summary must exist"
  it "summary is a minimum of 12 characters"
  it "summary is a maximum of 256 characters"

  it "heat must exist"
  it "heat is a minimum rating of 0"
  it "heat is a maximum rating of 5"

  it "flavor must exist"
  it "flavor is a minimum rating of 0"
  it "flavor is a maximum rating of 5"

  it "comments do not need to exist"
  it "comments can exist"

  it "can be saved" do
    sauce = FactoryBot.build(:sauce)
    result = sauce.save
    expect(result).to be true
  end

  it "is invalid without a name" do
    sauce = FactoryBot.build(:sauce, name: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "name cannot be less than 3 characters" do
    sauce = FactoryBot.build(:sauce, name: "Ab")
    result = sauce.save
    expect(result).to be false
  end

  it "name can be a minimum of 3 characters" do
    sauce = FactoryBot.build(:sauce, name: "Abc")
    result = sauce.save
    expect(result).to be true
  end

  it "name can be a maximum of 48 characters" do
    name = "a" * 48
    sauce = FactoryBot.build(:sauce, name: name)
    result = sauce.save
    expect(result).to be true
  end

  it "name cannot be greater than 48 characters" do
    name = "a" * 49
    sauce = FactoryBot.build(:sauce, name: name)
    result = sauce.save
    expect(result).to be false
  end

end
