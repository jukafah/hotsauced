# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_form', type: :view do
  it 'renders input form' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.new-sauce-form')
  end

  it 'renders error container' do
    sauce = FactoryBot.build(:sauce)
    sauce.errors.add(:name, 'cannot be blank')
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.error-explanation')
  end

  it 'renders name' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#sauce_title')
  end

  it 'renders summary' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#sauce_text')
  end

  it 'renders submit button' do
    sauce = FactoryBot.build(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('[type="submit"]')
  end

  it 'renders name error description' do
    sauce = FactoryBot.build(:sauce)
    sauce.errors.add(:name, 'must be a minimum of 5 characters')
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.error-explanation', text: 'must be a minimum of 5 characters')
  end

  it 'renders summary messages' do
    sauce = FactoryBot.build(:sauce)
    sauce.errors.add(:summary, 'must be a minimum of 12 characters')
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.error-explanation', text: 'must be a minimum of 12 characters')
  end
end
