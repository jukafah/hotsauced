# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SaucesHelper, type: :helper do
  context 'top sauces' do
    it 'limited to 5' do
      sauces = FactoryBot.create_list(:sauce, 10)
      FactoryBot.create(:review, sauce: sauces[0])
      FactoryBot.create(:review, sauce: sauces[1])
      FactoryBot.create(:review, sauce: sauces[2])
      FactoryBot.create(:review, sauce: sauces[3])
      FactoryBot.create(:review, sauce: sauces[4])
      FactoryBot.create(:review, sauce: sauces[5])
      FactoryBot.create(:review, sauce: sauces[6])
      top_sauces = helper.top_sauces
      expect(top_sauces.count(&:id)).to eq(5)
    end

    it 'returns top sauces by rating in descending order' do
      review_list_one = FactoryBot.build_list(:review, 3)
      review_list_two = FactoryBot.build_list(:review, 5)
      review_list_three = FactoryBot.build_list(:review, 10)
      FactoryBot.create(:sauce, reviews: review_list_one)
      FactoryBot.create(:sauce, reviews: review_list_two)
      FactoryBot.create(:sauce, reviews: review_list_three)
      top_sauces = helper.top_sauces
      top_sauces_sorted = top_sauces.sort_by { |sauce|
        sauce.reviews.average(:rating).round(1)
      }.reverse!
      expect(top_sauces).to eq(top_sauces_sorted)
    end
  end
end
