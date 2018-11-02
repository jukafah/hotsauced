# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sauces', type: :request do

  describe 'Page' do
    it 'displays' do
      get '/sauces'
      expect(response).to have_http_status(:ok)
    end

    it 'displays list of sauce cards'
    it 'navbar link active while on page'
    it 'page content displays'

    # should this test go here?
    it 'can search for sauces by name'

  end

  describe 'New Sauce' do
    it 'displays name'
    it 'displays summary'
    it 'displays heat'
    it 'displays flavor'
    it 'displays rating'
    it 'displays submit button'
  end

  it 'page content displays' do
    get '/sauces'
    expect(response.body).to have_selector('.sauce-page-content', count: 1)
  end

  it 'card list displays' do
    FactoryBot.create_list(:sauce, 10)
    get '/sauces'
    expect(response.body).to have_selector('.sauce.card', count: 10)
  end

  # cards
  describe 'Sauce cards' do
    it 'card displays'
    it 'card name displays'
    it 'name links to sauce display page'
    it 'card summary displays'
    it 'card heat rating displays'
    it 'card flavor rating displays'
    it 'card rating displays'
    it 'card comment count displays'
  end

  it 'card attributes display' do
    sauce = FactoryBot.create(:sauce)
    get '/sauces'
    expect(response.body).to have_selector('.sauce.card', count: 1) do
      expect(response.body).to have_selector('.sauce-name', text: sauce.name)
      expect(response.body).to have_selector('.sauce-summary', text: sauce.summary)
      expect(response.body).to have_selector('.sauce-heat', text: sauce.heat)
      expect(response.body).to have_selector('.sauce-flavor', text: sauce.flavor)
      expect(response.body).to have_selector('.sauce-rating', text: sauce.rating)
      expect(response.body).to have_selector('.sauce-comments', text: sauce.comments)
    end
  end

  # sauce display page

  describe 'Sauce display page' do
    it 'displays name'
    it 'displays summary'
    it 'displays heat'
    it 'displays flavor'
    it 'displays rating'
    it 'displays comments'
  end

  it 'displays sauce page' do
    sauce = FactoryBot.create(:sauce)
    get "/sauces/#{sauce.id}"
    expect(response).to have_http_status(:ok)
    expect(response.body).to have_selector('.sauce-name', text: sauce.name)
    expect(response.body).to have_selector('.sauce-summary', text: sauce.summary)
    expect(response.body).to have_selector('.sauce-heat', text: sauce.heat)
    expect(response.body).to have_selector('.sauce-flavor', text: sauce.flavor)
    expect(response.body).to have_selector('.sauce-rating', text: sauce.rating)
    expect(response.body).to have_selector('.sauce-comments', count: 1)
  end

  # submitting new sauce

  describe 'Create sauce' do
    it 'is invalid without name'
    it 'is invalid without summary'
    it 'is invalid without heat'
    it 'is invalid without flavor'
    it 'is invalid without rating'
    it 'it is valid with required attributes'
  end

  it 'can be submit' do
    post '/sauces', params: { sauce: { name: 'test post', summary: 'test post', heat: 5, flavor: 5, rating: 5 } }
    expect(response).to redirect_to('/sauces/1')
  end

  it 'displays submit page' do
    get '/sauces/new'
    expect(response).to have_http_status(:ok)
  end

  it 'can search for sauces by name'
  it 'navbar link becomes active'
  it 'card name links to sauce display page'

end
