# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sauces', type: :request do
  context 'page' do
    it 'returns successfully' do
      get '/sauces'
      expect(response).to have_http_status(:ok)
    end

    it 'SAUCES active on navbar' do
      get '/sauces'
      expect(response.body).to have_selector('.nav-link.active', count: 1, text: 'SAUCES')
    end

    it 'can search for sauces by name' do
      FactoryBot.create(:sauce)
      sauce = FactoryBot.create(:sauce, name: 'Different Sauce')
      get '/sauces', params: { q: { name_cont: sauce.name, commit: 'Search' } }
      expect(response.body).to have_selector('.sauce.card', count: 1, text: sauce.name)
    end
  end

  context 'Cards' do
    it 'display' do
      FactoryBot.create(:sauce)
      FactoryBot.create(:sauce, name: 'A Different Name')
      get '/sauces'
      expect(response.body).to have_selector('.sauce.card', count: 2)
    end
  end

  describe 'Sauce Display Page' do
    context 'when sauce exists' do
      it 'responds successfully' do
        sauce = FactoryBot.create(:sauce)
        get "/sauces/#{sauce.id}"
        expect(response).to have_http_status(:ok)
      end

      it 'responds with page content' do
        sauce = FactoryBot.create(:sauce)
        get "/sauces/#{sauce.id}"
        expect(response.body).to have_selector('.sauce-display-page.container')
      end

      it 'responds with SAUCES active on navbar' do
        sauce = FactoryBot.create(:sauce)
        get "/sauces/#{sauce.id}"
        expect(response.body).to have_selector('.nav-link.active', count: 1, text: 'SAUCES')
      end
    end

    context 'when sauce does not exist' do
      it 'handles error' do
        expect { get '/sauces/1' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'Submit New Sauce Page' do
    context 'page load' do
      it 'returns successfully' do
        get '/sauces/new'
        expect(response).to have_http_status(:ok)
      end

      it 'renders new sauce page content' do
        get '/sauces/new'
        expect(response.body).to have_selector('.new-sauce-page.container')
      end

      it 'SAUCE link is active in navbar' do
        get '/sauces/new'
        expect(response.body).to have_selector('.nav-link.active', count: 1, text: 'SAUCES')
      end

      it 'displays submit form' do
        get '/sauces/new'
        expect(response.body).to have_selector('.sauce-form')
      end
    end

    context 'with valid submission' do
      it 'redirects to new sauce page' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: 'Test Summary', pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response).to redirect_to('/sauces/1')
      end
    end

    context 'with invalid submission' do
      it 'displays error message without name' do
        post '/sauces', params: { sauce: { name: nil, description: 'test post description', pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'displays error message when name too short' do
        post '/sauces', params: { sauce: { name: nil, description: 'test post description', pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank and is too short (minimum is 1 character)")
      end

      it 'displays error message without description' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: nil, pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'displays error message when description too short' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: 'A', pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.invalid-feedback', text: 'is too short (minimum is 12 characters)')
      end

      it 'displays error message without pepper' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: 'Test Summary', pepper: nil, brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'displays error message without brand' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: 'Test Summary', pepper: 'Pepper', brand: nil, origin: 'Origin', ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'displays error message without origin' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: 'Test Summary', pepper: 'Pepper', brand: 'Brand', origin: nil, ingredients: 'Some ingredients' } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'displays error message without ingredients' do
        post '/sauces', params: { sauce: { name: 'Test Name', description: 'Test Summary', pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: nil } }
        expect(response.body).to have_selector('.is-invalid')
      end
    end
  end

  describe 'Update Sauce' do
    context 'Page' do
      it 'returns page successfully' do
        sauce = FactoryBot.create(:sauce)
        get "/sauces/#{sauce.id}/edit"
        expect(response).to have_http_status(:ok)
      end

      it 'displays page content' do
        sauce = FactoryBot.create(:sauce)
        get "/sauces/#{sauce.id}/edit"
        expect(response.body).to have_selector('.edit-sauce-page.container')
      end

      it 'displays not found when sauce not existing' do
        expect { get '/sauces/1/edit' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when valid' do
      it 'redirects to sauce display page' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', description: 'A great tasting sauce!', heat: 1, flavor: 1, rating: 1 } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'name can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different' } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'description can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { description: 'A great tasing sauce!' } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'heat can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { heat: 3 } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'flavor can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { flavor: 3 } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'rating can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { rating: 3 } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end
    end

    context 'when invalid' do
      it 'not updated with invalid name' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: nil, description: 'A great tasting sauce!', heat: 1, flavor: 1, rating: 1 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'not updated with invalid description' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', description: nil, heat: 1, flavor: 1, rating: 1 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'is not updated with invalid pepper' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', description: 'A great tasting sauce!', pepper: nil, ingredients: nil, brand: 'Brand', origin: 'Origin' } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'is not updated with invalid ingredients' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', description: 'A great tasting sauce!', pepper: 'Pepper', ingredients: nil, brand: 'Brand', origin: 'Origin' } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'is not updated with invalid brand' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', description: 'A great tasting sauce!', pepper: 'Pepper', ingredients: 'Some ingredients', brand: nil, origin: 'Origin' } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'is not updated with invalid origin' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', description: 'A great tasting sauce!', pepper: 'Pepper', ingredients: 'Some ingredients', brand: 'Brand', origin: nil } }
        expect(response.body).to have_selector('.is-invalid')
      end
    end
  end

  describe 'Delete sauce' do
    it 'existing sauces can be deleted' do
      sauce = FactoryBot.create(:sauce)
      delete "/sauces/#{sauce.id}"
      expect(response).to redirect_to('/sauces')
    end

    it 'non existing sauces handles error gracefully' do
      expect { delete '/sauces/1' }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'Sauce images' do
    it 'default image is loaded from google storage when not attached' do
      post '/sauces', params: { sauce: { name: 'Test Name', description: 'Test Summary', pepper: 'Pepper', brand: 'Brand', origin: 'Origin', ingredients: 'Some ingredients' } }
      get '/sauces/1'
      expect(response.body).to have_selector("img[src='https://storage.googleapis.com/hotsauced-pics/placeholder_bottle.svg']")
    end
  end
end
