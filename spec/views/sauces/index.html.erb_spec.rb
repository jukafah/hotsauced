# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/index', type: :view do
  it 'renders page content' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce-page.container')
  end

  it 'renders with list of sauces' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce', count: 2)
  end

  it 'renders no results' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    sauces.clear
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.no-results', count: 1)
  end

  it 'renders Add New Sauce button' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('#add-new-sauce', count: 1)
  end

  it 'renders Add New Sauce as link' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_link('Add New Sauce')
  end

  it 'renders top sauces' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauces, [sauce])
    render
    expect(rendered).to have_selector('.top-sauces')
  end
end
