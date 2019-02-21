# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_top_rated', type: :view do
  context 'when exist' do
    context 'name' do
      it 'renders text' do
        sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: sauce)
        assign(:top_rated, sauce)
        render
        expect(rendered).to have_selector('#name', text: sauce.name)
      end

      it 'renders as link' do
        sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: sauce)
        assign(:top_rated, sauce)
        render
        expect(rendered).to have_link(sauce.name)
      end
    end

    context 'rating' do
      it 'renders bottles' do
        sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: sauce)
        assign(:top_rated, sauce)
        render
        expect(rendered).to have_selector('#rating-bottle', count: 1)
      end

      it 'renders numerical rating' do
        sauce = FactoryBot.create(:sauce)
        FactoryBot.create(:review, sauce: sauce)
        assign(:top_rated, sauce)
        render
        expect(rendered).to have_selector('#average-rating', text: sauce.average_rating)
      end
    end
  end
end
