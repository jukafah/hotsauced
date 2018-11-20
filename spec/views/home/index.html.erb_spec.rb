# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  it 'renders page content' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('.home-page-content', count: 1)
  end

  it 'renders banner' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('.site-banner', count: 1)
  end

  it 'renders featured sauce' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    puts rendered
    expect(rendered).to have_selector('.featured-sauce .sauce.card')
  end

  it 'renders top sauces' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('.top-sauces')
  end

  it 'renders top 5 sauces as links' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'Different Sauce')
    sauce_three = FactoryBot.create(:sauce, name: 'Another One')
    sauce_four = FactoryBot.create(:sauce, name: 'Still different')
    sauce_five = FactoryBot.create(:sauce, name: 'Blah blah')
    sauce_six = FactoryBot.create(:sauce, name: 'Blah blah blah')
    assign(:sauces, [sauce_one, sauce_two, sauce_three, sauce_four, sauce_five, sauce_six])
    render
    expect(rendered).to have_selector('.sauce-name', count: 5)
  end
end
