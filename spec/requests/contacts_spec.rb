# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contact', type: :request do
  describe 'Page' do
    it 'displays' do
      get '/contact'
      expect(response).to have_http_status(200)
    end

    it 'displays page content' do
      get '/contact'
      expect(response.body).to have_selector('.contact-page-content', count: 1)
    end

    it 'displays avatar' do
      get '/contact'
      expect(response.body).to have_selector('.avatar', count: 1)
    end
  end

  describe 'Contact' do
    it 'displays Contact section link' do
      get '/contact'
      expect(response.body).to have_selector('.contact-link')
    end

    it 'displays Contact section link as active by default' do
      get '/contact'
      expect(response.body).to have_selector('.contact-link.active')
    end

    it 'displays Contact section content' do
      get '/contact'
      expect(response.body).to have_selector('.contact-section', count: 1)
    end
  end

  describe 'About' do
    it 'displays About section content' do
      get '/about'
      expect(response).to have_http_status(:ok)
      expect(response.body).to have_selector('.about-section', count: 1)
    end

    it 'displays About section link as active when visited' do
      get '/about'
      expect(response).to have_selector('.about-link.active')
    end

    it 'navbar link displays as active when on page path' do
      get '/contact'
      expect(response.body).to have_selector('.contact.nav-link.active')
    end
  end
end
