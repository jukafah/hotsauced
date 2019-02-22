# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home/index', type: :view do
  context 'template' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#home-page')
    end
  end

  context 'when the page renders' do
    it 'displays the banner' do
      render
      expect(rendered).to have_selector('#site-banner')
    end
  end

  context 'latest sauce' do
    it 'renders section' do
      render
      expect(rendered).to have_selector('#latest-sauce')
    end
  end

  context 'top rated sauces' do
    it 'renders section' do
      render
      expect(rendered).to have_selector('#top-rated')
    end
  end
end
