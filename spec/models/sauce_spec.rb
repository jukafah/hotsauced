require 'rails_helper'

RSpec.describe Sauce, type: :model do

  # test should be 'greater than n' characters
  # test should be 'less than n' characters
  # change name minimum to 1 character

  it "can be saved" do
    sauce = FactoryBot.build(:sauce)
    result = sauce.save
    expect(result).to be true
  end

  it "name must exist" do
    sauce = FactoryBot.build(:sauce, name: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "name must be unique" do
    FactoryBot.create(:sauce)
    sauce = FactoryBot.build(:sauce)
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

  it "summary must exist" do 
    sauce = FactoryBot.build(:sauce, summary: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "summary cannot be less than 12 characters" do
    summary = "a" * 11
    sauce = FactoryBot.build(:sauce, summary: summary)
    result = sauce.save
    expect(result).to be false
  end

  it "summary can be a minimum of 12 characters" do
    summary = "a" * 12
    sauce = FactoryBot.build(:sauce, summary: summary)
    result = sauce.save
    expect(result).to be true
  end

  it "summary cannot exceed 256 characters" do
    summary = "a" * 257
    sauce = FactoryBot.build(:sauce, summary: summary)
    result = sauce.save
    expect(result).to be false
  end

  it "summary can be a maximum of 256 characters" do
    summary = "a" * 256
    sauce = FactoryBot.build(:sauce, summary: summary)
    result = sauce.save
    expect(result).to be true
  end

  it "heat must exist" do
    sauce = FactoryBot.build(:sauce, heat: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "heat cannot be rated lower than 0" do
    sauce = FactoryBot.build(:sauce, heat: -1)
    result = sauce.save
    expect(result).to be false
  end

  it "heat is a minimum rating of 0" do
    sauce = FactoryBot.build(:sauce, heat: 0)
    result = sauce.save
    expect(result).to be true
  end

  it "heat cannot exceed a rating of 5" do
    sauce = FactoryBot.build(:sauce, heat: 6)
    result = sauce.save
    expect(result).to be false
  end

  it "heat is a maximum rating of 5" do
    sauce = FactoryBot.build(:sauce, heat: 5)
    result = sauce.save
    expect(result).to be true
  end
  
  it "flavor must exist" do
    sauce = FactoryBot.build(:sauce, flavor: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "flavor cannot have a lower rating than 0" do
    sauce = FactoryBot.build(:sauce, flavor: -1)
    result = sauce.save
    expect(result).to be false
  end

  it "flavor can have a minimum rating of 0" do
    sauce = FactoryBot.build(:sauce, flavor: 0)
    result = sauce.save
    expect(result).to be true
  end

  it "flavor cannot exceed a rating of 5" do
    sauce = FactoryBot.build(:sauce, flavor: 6)
    result = sauce.save
    expect(result).to be false
  end

  it "flavor can have a maximum rating of 5" do
    sauce = FactoryBot.build(:sauce, flavor: 5)
    result = sauce.save
    expect(result).to be true
  end

  it "rating must exist" do
    sauce = FactoryBot.build(:sauce, rating: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "user ratings can be a minimum of 0" do
    sauce = FactoryBot.build(:sauce, rating: 0)
    result = sauce.save
    expect(result).to be true
  end

  it "user ratings cannot be lower than 0" do
    sauce = FactoryBot.build(:sauce, rating: -1)
    result = sauce.save
    expect(result).to be false
  end

  it "user ratings cannot exceed a maximum of 5" do
    sauce = FactoryBot.build(:sauce, rating: 6)
    result = sauce.save
    expect(result).to be false
  end

  it "user ratings can be a maximum of 5" do
    sauce = FactoryBot.build(:sauce, rating: 5)
    result = sauce.save
    expect(result).to be true
  end

  it "image must exist" do
    sauce = FactoryBot.build(:sauce, image: nil)
    result = sauce.save
    expect(result).to be false
  end

  it "comments do not need to exist" do
    sauce = FactoryBot.build(:sauce, comments: [])
    result = sauce.save
    expect(result).to be true
  end

  it "comments can exist" do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.build(:sauce, comments: [comment])
    result = sauce.save
    expect(result).to be true
  end

end
