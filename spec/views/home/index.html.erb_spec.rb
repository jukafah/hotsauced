# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  context 'page' do
    it 'render page without sauce' do
      assign(:latest_sauce, nil)
      assign(:top_sauces, nil)
      render
      expect(rendered).to have_selector('#home-page')
    end

    it 'renders page content with sauces' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#home-page', count: 1)
    end

    it 'renders banner' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#banner', count: 1)
    end

    it 'renders latest sauce' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#latest-sauce')
    end

    it 'renders latest sauce name' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#latest-sauce #name')
    end

    it 'renders latest sauce summary' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#latest-sauce #summary')
    end
  end

  context 'sidebar' do
    it 'renders' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#sidebar')
    end

    it 'renders top sauces sidebar' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#top-sauces')
    end

    it 'renders top 5 sauces' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      sauce_one = FactoryBot.create(:sauce, name: 'Other Sauce')
      sauce_two = FactoryBot.create(:sauce, name: 'Different Sauce')
      sauce_three = FactoryBot.create(:sauce, name: 'Another One')
      sauce_four = FactoryBot.create(:sauce, name: 'Still different')
      sauce_five = FactoryBot.create(:sauce, name: 'Blah blah')
      assign(:top_sauces, [sauce_one, sauce_two, sauce_three, sauce_four, sauce_five])
      render
      expect(rendered).to have_selector('#top-sauce #name', count: 5)
    end

    it 'renders top 5 sauce ratings' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      sauce_one = FactoryBot.create(:sauce, name: 'Other Sauce')
      sauce_two = FactoryBot.create(:sauce, name: 'Different Sauce')
      sauce_three = FactoryBot.create(:sauce, name: 'Another One')
      sauce_four = FactoryBot.create(:sauce, name: 'Still different')
      sauce_five = FactoryBot.create(:sauce, name: 'Blah blah')
      assign(:top_sauces, [sauce_one, sauce_two, sauce_three, sauce_four, sauce_five])
      render
      expect(rendered).to have_selector('#top-sauce #rating', count: 5)
    end
  end
end
