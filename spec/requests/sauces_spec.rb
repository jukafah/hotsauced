# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sauces', type: :request do
  describe 'Page' do
    it 'displays' do
      get '/sauces'
      expect(response).to have_http_status(:ok)
    end

    it 'card list displays' do
      FactoryBot.create_list(:sauce, 10)
      get '/sauces'
      expect(response.body).to have_selector('.sauce.card', count: 10)
    end

    it 'navbar link active while on page' do
      get '/sauces'
      expect(response.body).to have_selector('.sauce.nav-link.active')
    end

    it 'page content displays' do
      get '/sauces'
      expect(response.body).to have_selector('.sauce-page-content', count: 1)
    end

    it 'can search for sauces by name' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces?utf8=✓&q%5Bname_cont%5D=#{sauce.name}&commit=Search"
      expect(response.body).to have_selector('.sauce-name', count: 1, exact_text: sauce.name)
    end

    it 'can search by name' do
      FactoryBot.create_list(:sauce, 10)
      sauce = FactoryBot.create(:sauce, name: 'Different Sauce')
      # get '/sauces', params: { utf8: '✓', q: { name_cont: sauce.name, commit: 'Search' } }
      get '/sauces', params: { q: { name_cont: sauce.name, commit: 'Search' } }
      expect(request.original_url).to eq('http://www.example.com/sauces?q[name_cont]=Different+Sauce&q[commit]=Search')
    end

    it 'search includes only name matches' do
      FactoryBot.create_list(:sauce, 6)
      sauce = FactoryBot.create(:sauce, name: 'Other Sauce')
      get "sauces?utf8=✓&q%5Bname_cont%5D=#{sauce.name}&commit=Search"
      expect(response.body).to have_selector('.sauce-name', count: 1, exact_text: sauce.name)
    end
  end

  describe 'Sauce cards' do
    it 'name displays' do
      sauce = FactoryBot.create(:sauce)
      get '/sauces'
      expect(response.body).to have_selector('.sauce-name', text: sauce.name)
    end

    it 'card name links to sauce display page' do
      sauce = FactoryBot.create(:sauce)
      get '/sauces'
      expect(response.body).to have_link(sauce.name)
    end

    it 'summary truncates at 300 characters' do
      summary = 'A'*350
      sauce = FactoryBot.create(:sauce, summary: summary)
      get '/sauces'
      expect(response.body).to have_selector('.sauce-summary', text: sauce.summary, count: 300)
    end

    it 'heat rating displays' do
      sauce = FactoryBot.create(:sauce)
      get '/sauces'
      expect(response.body).to have_selector('.sauce-heat', text: sauce.heat)
    end

    it 'flavor rating displays' do
      sauce = FactoryBot.create(:create)
      get '/sauces'
      expect(response.body).to have_selector('.sauce-flavor', text: sauce.flavor)
    end

    it 'rating displays' do
      sauce = FactoryBot.create(:create)
      get '/sauces'
      expect(response.body).to have_selector('.sauce-rating', text: sauce.rating)
    end

    it 'comment count displays' do
      sauce = FactoryBot.create(:create)
      get '/sauces'
      expect(response.body).to have_selector('.comments', text: sauce.comments.count)
    end
  end

  # Sauce display page
  describe 'Sauce display page' do
    it 'displays' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response).to have_http_status(:ok)
    end

    it 'displays page content' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.sauce-display-page-content')
    end

    it 'displays not found when sauce not existing' do
      get '/sauces/55'
      expect(response).to redirect_to('/sauces/notfound')
    end

    it 'navbar link is active' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('sauces.nav-link.active')
    end

    it 'displays name' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.sauce-name', text: sauce.name)
    end

    it 'displays summary' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.sauce-summary', text: sauce.summary)
    end

    it 'displays heat' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.sauce-heat', text: sauce.heat)
    end

    it 'displays flavor' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.sauce-flavor', text: sauce.flavor)
    end

    it 'displays rating' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.sauce-rating', text: sauce.rating)
    end

    it 'displays comments' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}"
      expect(response.body).to have_selector('.comments')
    end
  end

  describe 'Submit new sauce' do
    it 'displays submit page' do
      get '/sauces/new'
      expect(response).to have_http_status(:ok)
    end

    it 'displays page content' do
      get '/sauces/new'
      expect(response.body).to have_selector('.new-sauce-page-content')
    end

    it 'SAUCE link is active in navbar' do
      get '/sauces/new'
      expect(response.body).to have_selector('.sauce.nav-link.active')
    end

    it 'displays submit form' do
      get '/sauces/new'
      expect(response.body).to have_selector('.sauce-form')
    end

    it 'displays name' do
      get '/sauces/new'
      expect(response.body).to have_selector('.name')
    end

    it 'displays summary' do
      get '/sauces/new'
      expect(response.body).to have_selector('.summary')
    end

    it 'displays heat' do
      get '/sauces/new'
      expect(response.body).to have_selector('.heat')
    end

    it 'displays flavor' do
      get '/sauces/new'
      expect(response.body).to have_selector('.flavor')
    end

    it 'displays rating' do
      get '/sauces/new'
      expect(response.body).to have_selector('.rating')
    end

    it 'displays submit button' do
      get '/sauces/new'
      expect(response.body).to have_selector('.submit')
    end

    it 'is invalid without name' do
      post '/sauces', params: { sauce: { name: nil, summary: 'test post', heat: 5, flavor: 5, rating: 5 } }
      expect(response).to redirect_to('/sauces/new')
    end

    it 'is invalid without summary' do
      post '/sauces', params: { sauce: { name: 'Test Name', summary: nil, heat: 5, flavor: 5, rating: 5 } }
      expect(response).to redirect_to('/sauces/new')
    end

    it 'is invalid without heat' do
      post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: nil, flavor: 5, rating: 5 } }
      expect(response).to redirect_to('/sauces/new')
    end

    it 'is invalid without flavor' do
      post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: 5, flavor: nil, rating: 5 } }
      expect(response).to redirect_to('/sauces/new')
    end

    it 'is invalid without rating' do
      post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: 5, flavor: 5, rating: nil } }
      expect(response).to redirect_to('/sauces/new')
    end

    it 'it is valid with required attributes' do
      post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: 5, flavor: 5, rating: 5 } }
      expect(response).to redirect_to('/sauces/1')
    end
  end

  describe 'Update Sauce' do
    it 'displays page' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}/edit"
      expect(response).to have_http_status(:ok)
    end

    it 'displays page content' do
      sauce = FactoryBot.create(:sauce)
      get "/sauces/#{sauce.id}/edit"
      expect(response.body).to have_selector('.edit-sauce-page-content')
    end

    it 'displays not found when sauce not existing' do
      get '/sauces/27/edit'
      expect(response).to redirect_to('/sauces/notfound')
    end

    it 'can be updated with valid parameters' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'Different', heat: 1, flavor: 1, rating: 1 } }
      expect(response).to redirect_to("/sauces/#{sauce.id}")
    end

    it 'name can be updated' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different' } }
      expect(response.body).to have_selector('.sauce-name', text: 'Different', summary: sauce.summary)
    end

    it 'name can be updated' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { summary: 'Different' } }
      expect(response.body).to have_selector('.sauce-name', text: sauce.name, summary: 'Different')
    end

    it 'can be updated with valid parameters' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'Different', heat: 1, flavor: 1, rating: 1 } }
      expect(response.body).to have_selector('.sauce-name', text: 'Different')
    end

    it 'is not updated with invalid name' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: nil, summary: 'Different', heat: 1, flavor: 1, rating: 1 } }
      expect(response).to redirect_to("/sauces/#{sauce.id}/edit")
    end

    it 'is not updated with invalid summary' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: nil, heat: 1, flavor: 1, rating: 1 } }
      expect(response).to redirect_to("/sauces/#{sauce.id}/edit")
    end

    it 'is not updated with invalid heat' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'Different', heat: nil, flavor: 1, rating: 1 } }
      expect(response).to redirect_to("/sauces/#{sauce.id}/edit")
    end

    it 'is not updated with invalid flavor' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'Different', heat: 1, flavor: nil, rating: 1 } }
      expect(response).to redirect_to("/sauces/#{sauce.id}/edit")
    end

    it 'is not updated with invalid rating' do
      sauce = FactoryBot.create(:sauce)
      put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'Different', heat: 1, flavor: 1, rating: nil } }
      expect(response).to redirect_to("/sauces/#{sauce.id}/edit")
    end
  end

  describe 'Delete sauce' do
    it 'existing sauces can be deleted' do
      sauce = FactoryBot.create(:sauce)
      delete "/sauces/#{sauce.id}"
      expect(response).to redirect_to("/sauces")
    end

    it 'non existing sauces handles error gracefully' do
      delete '/sauces/1'
      expect(response).to have_http_status(:notfound)
    end
  end
end
