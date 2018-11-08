require 'rails_helper'

RSpec.describe 'comments/_comment', type: :view do

  it 'renders' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.comment', count: 1)
  end

  it 'renders partial per comment' do
    comments = FactoryBot.build_list(:comment, 4)
    sauce = FactoryBot.create(:sauce, comments: comments)
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.comment', count: 4)
  end

  it 'renders user layout' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.user-layout', text: comment.commenter)
  end

  it 'renders comment body layout' do
    comment = FactoryBot.build(:comment)
    sauce = FactoryBot.create(:sauce, comments: [comment])
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.body-layout', text: comment.body)
  end

end
