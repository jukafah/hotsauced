# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/_contact_form', type: :view do
  context 'template' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#contact-section')
    end
  end

  context 'header' do
    it 'renders text' do
      render
      expect(rendered).to have_selector('#contact-section #header', text: 'CONTACT')
    end
  end

  context 'body' do
    it 'renders text' do
      render
      expect(rendered).to have_selector('#contact-section #body p')
    end
  end

  context 'links' do
    it 'renders github icon' do
      render
      expect(rendered).to have_selector('#github')
    end

    it 'renders github link' do
      render
      expect(rendered).to have_selector('a #github')
    end

    it 'renders linkedin icon' do
      render
      expect(rendered).to have_selector('#linkedin')
    end

    it 'renders linkedin link' do
      render
      expect(rendered).to have_selector('a #linkedin')
    end
  end

  context 'name' do
    it 'renders control' do
      render
      expect(rendered).to have_selector('#name').and have_no_selector('.is-invalid')
    end

    it 'renders placeholder text' do
      render
      expect(rendered).to have_selector("input[placeholder='YOUR NAME']")
    end

    it 'renders error' do
      contact = Contact.new
      contact.errors.add(:name)
      assign(:contact, contact)
      render
      expect(rendered).to have_selector('.is-invalid', count: 1).and have_selector('#name.is-invalid')
    end
  end

  context 'email address' do
    it 'renders control' do
      render
      expect(rendered).to have_selector('#email').and have_no_selector('.is-invalid')
    end

    it 'renders placeholder text' do
      render
      expect(rendered).to have_selector("input[placeholder='YOUR E-MAIL ADDRESS']")
    end

    it 'renders error' do
      contact = Contact.new
      contact.errors.add(:email)
      assign(:contact, contact)
      render
      expect(rendered).to have_selector('.is-invalid', count: 1).and have_selector('#email.is-invalid')
    end
  end

  context 'body' do
    it 'renders control' do
      render
      expect(rendered).to have_selector('#body').and have_no_selector('.is-invalid')
    end

    it 'renders placeholder text' do
      render
      expect(rendered).to have_selector("textarea[placeholder='YOUR MESSAGE']")
    end

    it 'renders error' do
      contact = Contact.new
      contact.errors.add(:body)
      assign(:contact, contact)
      render
      expect(rendered).to have_selector('.is-invalid', count: 1).and have_selector('#body.is-invalid')
    end
  end

  context 'submit button' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#submit-form')
    end
  end
end
