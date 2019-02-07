# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Reviews', type: :request do

  it 'can be duplicates' do
    sauce = FactoryBot.create(:sauce)
    FactoryBot.create(:review, sauce: sauce)
    FactoryBot.create(:review, sauce: sauce)
    get "/sauces/#{sauce.id}"
    expect(response).to have_http_status(:ok)
  end

  context 'when valid' do
    it 'creates successfully' do
      sauce = FactoryBot.create(:sauce)
      post "/sauces/#{sauce.id}/reviews", params: { review: { user: 'Some Person', headline: 'A headline!', body: 'Some Comment', rating: 5 } }
      expect(response).to redirect_to("/sauces/#{sauce.id}")
    end

    # TODO: reimplement
    # it 'it displays on page after posting' do
    #   sauce = FactoryBot.create(:sauce)
    #   post "/sauces/#{sauce.id}/reviews", params: { review: { user: 'Some Person', body: 'Some Comment', rating: 5 } }
    #   get "/sauces/#{sauce.id}"
    #   expect(response.body).to have_selector('#review')
    # end
  end

  it 'are invalid without user' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/reviews", params: { review: { user: nil, headline: 'A headline!', body: 'Some Comment', rating: 3 } }
    puts response
    puts response.body
    expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank and is too short (minimum is 1 character)")
  end

  it 'are invalid without body' do
    sauce = FactoryBot.create(:sauce)
    post "/sauces/#{sauce.id}/reviews", params: { review: { user: 'A great tasting sauce!', headline: 'A headline!', body: nil, rating: 5 } }
    expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank and is too short (minimum is 2 characters)")
  end

  # TODO: reimplement
  # it 'body can be edited' do
  #   sauce = FactoryBot.create(:sauce)
  #   review = FactoryBot.create(:review, sauce: sauce)
  #   put "/sauces/#{sauce.id}/reviews/#{review.id}", params: { review: { body: 'A Different Body' } }
  #   get "/sauces/#{sauce.id}"
  #   expect(response.body).to have_selector('#body-layout', text: 'A Different Body')
  # end

  it 'name can not be edited' do
    sauce = FactoryBot.create(:sauce)
    review = FactoryBot.create(:review, sauce: sauce)
    put "/sauces/#{sauce.id}/reviews/#{review.id}", params: { review: { user: 'Different Name' } }
    expect(response).to redirect_to("/sauces/#{sauce.id}")
  end

  # TODO: reimplement
  # it 'can be deleted' do
  #   review = FactoryBot.build(:review)
  #   sauce = FactoryBot.create(:sauce, reviews: [review])
  #   delete "/sauces/#{sauce.id}/reviews/#{review.id}"
  #   expect(response).to redirect_to("/sauces/#{sauce.id}")
  # end

  it 'deleted review is no longer displayed' do
    review = FactoryBot.build(:review)
    sauce = FactoryBot.create(:sauce, reviews: [review])
    delete "/sauces/#{sauce.id}/reviews/#{review.id}"
    expect(response).to have_no_selector('#review')
  end
end
