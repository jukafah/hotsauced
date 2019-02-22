# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sauces', type: :request do
  context 'sauces listing' do
    context 'when sauces exist' do
      it 'responds with 200' do
        FactoryBot.create(:sauce)
        get sauces_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when sauces do not exist' do
      it 'responds with 200' do
        get sauces_path
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'when a search is performed' do
    it 'responds with 200' do
      get sauces_path, params: { q: 'Search' }
      expect(response).to have_http_status(:ok)
    end
  end

  context 'sauce display page' do
    context 'when resource is found' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        get sauce_path(sauce)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when resource is not found' do
      it 'raises record not found' do
        expect { get sauce_path(id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'submitting a new sauce' do
    context 'when resource is found' do
      it 'responds with 200' do
        get new_sauce_path
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid parameters' do
      it 'sauce is created and redirects to sauce display page' do
        sauce = FactoryBot.build_stubbed(:sauce)
        post sauces_path, params: { sauce: sauce.attributes }
        expect(response).to redirect_to(sauce_path(id: '1'))
      end

      it 'does not require an image' do
        sauce = FactoryBot.build_stubbed(:sauce, image: nil)
        post sauces_path, params: { sauce: sauce.attributes }
        expect(response).to redirect_to(sauce_path(id: '1'))
      end
    end

    context 'with invalid parameters' do
      it 'responds with 422' do
        post sauces_path, params: { sauce: { name: 'a name' } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when sauce parameter is missing' do
      it 'raises parameter missing' do
        expect { post sauces_path, params: {} }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe 'updating a sauce' do
    context 'when resource is found' do
      it 'responds with 200' do
        sauce = FactoryBot.create(:sauce)
        get edit_sauce_path(sauce)
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when resource is not found' do
      it 'raises record not found' do
        expect { get edit_sauce_path(id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when updated with valid parameter' do
      it 'redirects to sauce display page' do
        sauce = FactoryBot.create(:sauce)
        patch sauce_path(sauce), params: { sauce: { description: 'A different description!' } }
        expect(response).to redirect_to(sauce_path(sauce))
        follow_redirect!
        expect(response.body).to have_selector('#description', text: 'A different description!')
      end
    end

    context 'when updated with invalid parameter' do
      it 'not responds with 422' do
        sauce = FactoryBot.create(:sauce)
        put sauce_path(sauce), params: { sauce: { name: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'deleting a sauce' do
    context 'when resource found' do
      it 'deletes from database' do
        sauce = FactoryBot.create(:sauce)
        delete sauce_path(sauce)
        expect(response).to redirect_to(sauces_path)
        expect { get sauce_path(sauce) }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when resource is not found' do
      it 'raises record not found' do
        expect { delete sauce_path(id: '1') }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe 'sauce image' do
    it 'is not required' do
      sauce = FactoryBot.build_stubbed(:sauce, image: nil)
      post sauces_path, params: { sauce: sauce.attributes }
      expect(response).to redirect_to(sauce_path(id: '1'))
    end
  end
end
