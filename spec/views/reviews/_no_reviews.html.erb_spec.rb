require 'rails_helper'

RSpec.describe 'reviews/_no_reviews', type: :view do
  context 'template' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#no-reviews')
    end
  end

  context 'header' do
    it 'renders text' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#no-reviews', text: "There's nothing here yet...")
    end
  end

  context 'call to action' do
    it 'renders' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#new-review')
    end

    it 'renders link' do
      sauce = FactoryBot.create(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_link('Be the first!')
    end
  end
end
