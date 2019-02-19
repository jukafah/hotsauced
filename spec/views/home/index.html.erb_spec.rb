# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do

  # let!(:sauce_list) { FactoryBot.create_list(:sauce, 6) }
  # # top sauce => 1
  # let!(:sauce_six_rating) { FactoryBot.create(:review, rating: 5, sauce: sauce_list[5]) }
  # # top sauce => 2
  # let!(:sauce_four_rating) { FactoryBot.create(:review, rating: 5, sauce: sauce_list[3]) }
  # # top sauce => 3
  # let!(:sauce_five_rating) { FactoryBot.create(:review, rating: 4, sauce: sauce_list[4]) }
  # # top sauce => 4
  # let!(:sauce_one_rating) { FactoryBot.create(:review, rating: 3, sauce: sauce_list[0]) }
  # # top sauce => 5
  # let!(:sauce_two_rating) { FactoryBot.create(:review, rating: 2, sauce: sauce_list[1]) }
  # # top sauce => not on list
  # let!(:sauce_three_rating) { FactoryBot.create(:review, rating: 1, sauce: sauce_list[2]) }
 # TODO: top sauce test
  # it 'renders 5 top sauces as links' do
  #   sorted_list = sauce_list.sort_by { |sauce| sauce.reviews[0].rating }.reverse!
  #   expected_top_sauces = sorted_list.map(&:name)
  #   visit home_path
  #   all(:css, '#top-sauces #name').each_with_index do |element, index|
  #     expect(element.text).to eq(expected_top_sauces[index])
  #   end
  # end

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

    it 'renders latest sauce description' do
      latest_sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, latest_sauce)
      top_sauce = FactoryBot.create(:sauce, name: 'Different sauce')
      assign(:top_sauces, [top_sauce])
      render
      expect(rendered).to have_selector('#latest-sauce #description')
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
