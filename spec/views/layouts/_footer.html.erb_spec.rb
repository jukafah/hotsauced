# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_footer', type: :view do
  context 'template' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#footer', count: 1)
    end
  end

  context 'copyright' do
    it 'renders text' do
      render
      expect(rendered).to have_selector('#copyright', text: "Copyright © #{Date.today.year} HOT SAUCED")
    end
  end

  context 'social share' do
    it 'renders github link'
    it 'renders linkedin link'
    it 'renders instagram link'
    it 'renders pinterest link'
    it 'renders twitter link'
  end
end
