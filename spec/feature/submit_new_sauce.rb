# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Submit new sauce', type: :feature, js: true, driver: :selenium_chrome do
  context 'when valid' do
    it 'redirects to sauce display page' do
      visit sauces_path
      click_link id: 'add-new-sauce'
      fill_in id: 'name', with: 'Hot Sauce'
      fill_in id: 'description', with: 'Sauce Description'
      fill_in id: 'pepper', with: 'Pepper'
      fill_in id: 'ingredients', with: 'ingredients'
      fill_in id: 'brand', with: 'brand'
      fill_in id: 'origin', with: 'origin'
      click_button id: 'submit-form'
      expect(page).to have_current_path(sauce_path(id: '1'))
      expect(page).to have_selector('#name', text: 'Hot Sauce')
    end
  end

  context 'when invalid' do
    it 'reloads page and renders error messages' do
      visit new_sauce_path
      click_button id: 'submit-form'
      expect(page).to have_selector('.is-invalid.form-control', count: 6)
    end
  end
end
