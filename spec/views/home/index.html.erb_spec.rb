# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  context 'page' do
    it 'render page without sauce' do
      assign(:latest_sauce, nil)
      assign(:top_sauces, nil)
      render
      expect(rendered).to have_selector('.home-page.container')
    end
    it 'renders page content' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('.home-page.container', count: 1)
    end

    it 'renders banner' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#banner', count: 1)
    end
  end

  context 'latest sauce' do
    it 'renders latest sauce' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('.latest-sauce')
    end
  end

  context 'top sauce sidebar' do
    it 'renders top sauces' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('.top-sauces')
    end

    it 'renders top 5 sauces as links' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      sauce_one = FactoryBot.create(:sauce, name: 'Other Sauce')
      sauce_two = FactoryBot.create(:sauce, name: 'Different Sauce')
      sauce_three = FactoryBot.create(:sauce, name: 'Another One')
      sauce_four = FactoryBot.create(:sauce, name: 'Still different')
      sauce_five = FactoryBot.create(:sauce, name: 'Blah blah')
      assign(:top_sauces, [sauce_one, sauce_two, sauce_three, sauce_four, sauce_five])
      render
      expect(rendered).to have_selector('.top-sauces .sauce-name', count: 5)
    end
  end
end
