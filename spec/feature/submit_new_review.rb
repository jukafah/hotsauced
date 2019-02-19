# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Submit new review', type: :feature, js: true, driver: :selenium_chrome do
  let!(:sauce) { FactoryBot.create(:sauce) }
  let!(:review) { FactoryBot.create(:review, sauce: sauce) }

  context 'when valid' do
    it 'redirect back to sauce and review is posted' do
      visit sauce_path(sauce)
      click_link id: 'new-review'
      fill_in id: 'user', with: 'User'
      fill_in id: 'rating', with: '3'
      fill_in id: 'headline', with: 'Headline'
      fill_in id: 'body', with: 'body'
      click_button id: 'submit-form'
      expect(page).to have_current_path(sauce_path(id: '1'))
      expect(page).to have_selector('#review #user', text: 'User')
    end
  end

  context 'when invalid' do
    it 'reloads page and renders error messages' do
      visit sauce_path(sauce)
      click_link id: 'new-review'
      click_button id: 'submit-form'
      expect(page).to have_selector('.is-invalid.form-control', count: 4)
    end
  end
end
