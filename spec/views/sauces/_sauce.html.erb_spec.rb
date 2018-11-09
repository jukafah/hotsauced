# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_sauce', type: :view do
  it 'renders sauce display page' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-display-page')
  end

  it 'renders name' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-name', count: 1, text: sauce.name)
  end

  it 'renders summary' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-summary', count: 1, text: sauce.summary)
  end

  it 'renders heat' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-heat', count: 1, text: sauce.heat)
  end

  it 'renders flavor' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-flavor', count: 1, text: sauce.flavor)
  end

  it 'renders rating' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-rating', count: 1, text: sauce.rating)
  end

  it 'renders edit controls' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.edit-controls')
  end

  it 'renders comment section' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comments')
  end

  it 'renders comments' do
    sauce = FactoryBot.create(:sauce)
    comments = FactoryBot.build_list(:comment, 2)
    sauce.comments.push(comments)
    assign(:sauce, sauce)
    render
    # puts rendered
    expect(rendered).to have_selector('.comment', count: 2)
  end

  it 'renders user layout' do
    sauce = FactoryBot.create(:sauce)
    comments = FactoryBot.build_list(:comment, 2)
    sauce.comments.push(comments)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment .user-layout', count: 2)
  end

  it 'renders body layout' do
    sauce = FactoryBot.create(:sauce)
    comments = FactoryBot.build_list(:comment, 2)
    sauce.comments.push(comments)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment .body-layout', count: 2)
  end

  it 'renders comment controls' do
    sauce = FactoryBot.create(:sauce)
    comments = FactoryBot.build_list(:comment, 2)
    sauce.comments.push(comments)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment .controls', count: 2)
  end

  it 'renders comment form' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment-form', count: 1)
  end

  it 'renders comment input' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment-form .body')
  end

  it 'renders submit button' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment-form .submit')
  end
end
