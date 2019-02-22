# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sending contact email', type: :feature, js: true, driver: :selenium_chrome do
  context 'when valid' do
    it 'displays modal and closing refreshes form' do
      visit about_path
      fill_in id: 'name', with: 'name'
      fill_in id: 'email', with: 'someone@somewhere.com'
      fill_in id: 'body', with: 'this is a message'
      click_button id: 'submit-form'
      expect(page).to have_selector('#title', text: 'Message Sent')
      page.evaluate_script("$('#modal-window').modal('show')")
      click_button id: 'close'
      expect(page).to have_selector('#name', text: '')
      expect(page).to have_selector('#email', text: '')
      expect(page).to have_selector('#body', text: '')
    end
  end

  context 'when invalid' do
    it 'form controls display as invalid entry' do
      visit about_path
      click_button id: 'submit-form'
      expect(page).to have_selector('#name.is-invalid')
      expect(page).to have_selector('#email.is-invalid')
      expect(page).to have_selector('#body.is-invalid')
    end
  end
end
