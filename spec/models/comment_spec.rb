require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "can be saved" do
    sauce = FactoryBot.create(:sauce)
    comment = FactoryBot.build(:comment, sauce: sauce)
    result = comment.save
    expect(result).to be true
  end

  it "can be a list" do
    comments = FactoryBot.build_list(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comments])
    result = comments.save
    expect(result).to be true
  end

  it "name must exist" do
    comment = FactoryBot.build(:comment, commenter: nil)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be false
  end

  it "name cannot be less than 2 characters" do
    comment = FactoryBot.build(:comment, commenter: "A")
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be false
  end

  it "name can be a minimum of 2 characters" do
    comment = FactoryBot.build(:comment, commenter: "Ab")
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be true
  end

  it "name cannot be more than 48 characters" do
    name = "A" * 49
    comment = FactoryBot.build(:comment, commenter: name)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be false
  end

  it "name can be a maximum of 48 characters" do
    name = "A" * 48
    comment = FactoryBot.build(:comment, commenter: name)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be true
  end

  it "body must exist" do
    comment = FactoryBot.build(:comment, body: nil)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be false
  end

  it "body cannot be less than 2 characters" do
    comment = FactoryBot.build(:comment, body: "A")
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be false
  end

  it "body can be 2 characters" do
    comment = FactoryBot.build(:comment, body: "Ab")
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be true
  end

  it "body can be a maximum of 256 characters" do
    body = "A" * 256
    comment = FactoryBot.build(:comment, body: body)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be true
  end

  it "body cannot exceed 256 characters" do
    body = "A" * 257
    comment = FactoryBot.build(:comment, body: body)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    result = comment.save
    expect(result).to be false
  end

end
