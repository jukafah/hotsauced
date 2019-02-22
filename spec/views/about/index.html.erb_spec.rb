# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'about/index', type: :view do
  context 'template' do
    it 'renders' do
      render
      expect(rendered).to have_selector('#about-page')
    end
  end

  context 'heat statement' do
    it 'renders label' do
      render
      expect(rendered).to have_selector('#heat')
    end

    it 'renders description' do
      render
      expect(rendered).to have_selector('#heat p')
    end
  end

  context 'flavor statement' do
    it 'renders label' do
      render
      expect(rendered).to have_selector('#flavor')
    end

    it 'renders description' do
      render
      expect(rendered).to have_selector('#flavor p')
    end
  end

  context 'peppers statement' do
    it 'renders label' do
      render
      expect(rendered).to have_selector('#peppers')
    end

    it 'renders description' do
      render
      expect(rendered).to have_selector('#peppers p')
    end
  end

  context 'sauce statement' do
    it 'renders label' do
      render
      expect(rendered).to have_selector('#sauce')
    end

    it 'renders description' do
      render
      expect(rendered).to have_selector('#sauce p')
    end
  end

  context 'developed by' do
    it 'renders avatar' do
      render
      expect(rendered).to have_selector('#developed-by #avatar')
    end

    it 'renders header' do
      render
      expect(rendered).to have_selector('#developed-by #header')
    end

    it 'renders name' do
      render
      expect(rendered).to have_selector('#developed-by #name', text: 'STEVE MOMCILOVIC')
    end
  end

  context 'contact' do
    it 'renders section' do
      render
      expect(rendered).to have_selector('#contact-section')
    end
  end
end
