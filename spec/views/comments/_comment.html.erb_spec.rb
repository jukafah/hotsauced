# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'comments/_comment', type: :view do
  it 'renders' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:comment, sauce: sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment', count: 1)
  end

  it 'renders partial per comment' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:comment, sauce: sauce)
    FactoryBot.create(:comment, sauce: sauce)
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.comment', count: 2)
  end

  it 'renders user layout' do
    sauce = FactoryBot.create(:sauce)
    comment = FactoryBot.create(:comment, sauce: sauce)
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.user-layout', text: comment.commenter)
  end

  it 'renders comment body layout' do
    sauce = FactoryBot.create(:sauce)
    comment = FactoryBot.create(:comment, sauce: sauce)
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.body-layout', text: comment.body)
  end

  it 'renders comment controls' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:comment, sauce: sauce)
    FactoryBot.create(:comment, sauce: sauce)
    assign(:sauce, sauce)

    render
    expect(rendered).to have_selector('.comment .controls', count: 2)
  end
end
