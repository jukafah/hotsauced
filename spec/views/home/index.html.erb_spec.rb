# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do

  context 'when the page renders' do
    it 'displays the banner' do
      render
      expect(rendered).to have_selector('#site-banner')
    end
  end

  context 'when sauces exist' do
    it 'page renders with sauces' do
      sauces = FactoryBot.create_list(:sauce, 5)
      assign(:top_sauces, sauces)
      assign(:latest_sauce, sauces[4])
      render
      expect(rendered).to have_selector('#home-page')
    end
  end

  context 'when sauces do not exist' do
    it 'page renders without sauces' do
      render
      expect(rendered).to have_selector('#home-page')
    end
  end

  context 'latest sauce' do
    it 'renders section' do
      sauce = FactoryBot.create(:sauce)
      assign(:latest_sauce, sauce)
      render
      expect(rendered).to have_selector('#latest-sauce')
    end
  end

  context 'top rated sauces' do
    it 'renders section' do
      sauces = FactoryBot.create_list(:sauce, 5)
      assign(:top_sauces, sauces)
      render
      expect(rendered).to have_selector('#top-rated')
    end
  end
end
