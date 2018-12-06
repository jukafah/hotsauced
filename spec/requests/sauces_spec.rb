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
        post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: 5, flavor: 5, rating: 5 } }
        expect(response).to redirect_to('/sauces/1')
      end
    end

    context 'with invalid submission' do
      it 'displays error message without name' do
        post '/sauces', params: { sauce: { name: nil, summary: 'test post summary', heat: 5, flavor: 5, rating: 5 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'displays error message when name too short' do
        post '/sauces', params: { sauce: { name: nil, summary: 'test post summary', heat: 5, flavor: 5, rating: 5 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank and is too short (minimum is 1 character)")
      end

      it 'displays error message without summary' do
        post '/sauces', params: { sauce: { name: 'Test Name', summary: nil, heat: 5, flavor: 5, rating: 5 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'displays error message when summary too short' do
        post '/sauces', params: { sauce: { name: 'Test Name', summary: 'A', heat: 5, flavor: 5, rating: 5 } }
        expect(response.body).to have_selector('.invalid-feedback', text: 'is too short (minimum is 12 characters)')
      end

      it 'displays error message without heat' do
        post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: nil, flavor: 5, rating: 5 } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'displays error message without flavor' do
        post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: 5, flavor: nil, rating: 5 } }
        expect(response.body).to have_selector('.is-invalid')
      end

      it 'displays error message without rating' do
        post '/sauces', params: { sauce: { name: 'Test Name', summary: 'Test Summary', heat: 5, flavor: 5, rating: nil } }
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
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'A great tasting sauce!', heat: 1, flavor: 1, rating: 1 } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'name can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different' } }
        expect(response).to redirect_to("/sauces/#{sauce.id}")
      end

      it 'summary can be updated' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { summary: 'A great tasing sauce!' } }
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
        put "/sauces/#{sauce.id}", params: { sauce: { name: nil, summary: 'A great tasting sauce!', heat: 1, flavor: 1, rating: 1 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'not updated with invalid summary' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: nil, heat: 1, flavor: 1, rating: 1 } }
        expect(response.body).to have_selector('.invalid-feedback', text: "can't be blank")
      end

      it 'is not updated with invalid heat' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'A great tasting sauce!', heat: nil, flavor: 1, rating: 1 } }
        expect(response.body).to have_selector('.is-invalid', text: 'Heat')
      end

      it 'is not updated with invalid flavor' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'A great tasting sauce!', heat: 1, flavor: nil, rating: 1 } }
        expect(response.body).to have_selector('.is-invalid', text: 'Flavor')
      end

      it 'is not updated with invalid rating' do
        sauce = FactoryBot.create(:sauce)
        put "/sauces/#{sauce.id}", params: { sauce: { name: 'Different', summary: 'A great tasting sauce!', heat: 1, flavor: 1, rating: nil } }
        expect(response.body).to have_selector('.is-invalid', text: 'Rating')
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
end
