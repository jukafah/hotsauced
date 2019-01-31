# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/show', type: :view do
  it 'renders sauce display page' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.sauce-display-page.container')
  end

  it 'renders name' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#name', count: 1, text: sauce.name)
  end

  it 'renders description' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#description', count: 1, text: sauce.description)
  end

  it 'renders pepper' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#pepper', count: 1, text: sauce.pepper)
  end

  it 'renders brand' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#brand', count: 1, text: sauce.brand)
  end

  it 'renders ingredients' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#ingredients', count: 1, text: sauce.ingredients)
  end

  it 'renders origin' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#origin', count: 1, text: sauce.origin)
  end

  it 'renders rating' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('#rating', count: 1)
  end

  it 'renders edit controls' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.edit-sauce')
  end

# TODO: needs to be refactored with new review implementation
  # it 'renders reviews section' do
  #   sauce = FactoryBot.create(:sauce)
  #   assign(:sauce, sauce)
  #   render
  #   expect(rendered).to have_selector('.reviews')
  # end

  # it 'renders reviews section' do
  #   sauce = FactoryBot.create(:sauce)
  #   FactoryBot.create(:review, sauce: sauce)
  #   assign(:sauce, sauce)
  #   render
  #   expect(rendered).to have_selector('#reviews')
  # end

# TODO: needs to be refactored with new review implementation
  # it 'renders review form' do
  #   sauce = FactoryBot.create(:sauce)
  #   assign(:sauce, sauce)
  #   render
  #   expect(rendered).to have_selector('#review-form', count: 1)
  # end
end
