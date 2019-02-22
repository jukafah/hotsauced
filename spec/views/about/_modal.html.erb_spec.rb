# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/_modal', type: :view do
  context 'template' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#modal-window')
    end
  end

  context 'header' do
    it 'renders title' do
      render
      expect(rendered).to have_selector('#title', text: 'Message Sent')
    end

    it 'renders x button' do
      render
      expect(rendered).to have_selector('#x')
    end
  end

  context 'body' do
    it 'renders text' do
      render
      expect(rendered).to have_selector('#body p')
    end
  end

  context 'footer' do
    it 'renders close button' do
      render
      expect(rendered).to have_selector('#close')
    end
  end
end
