# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_form', type: :view do
  context 'template' do
    it 'renders' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#sauce-form')
    end
  end

  context 'name' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#name')
    end

    it 'renders placeholder text' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Name']")
    end
  end

  context 'description' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#description')
    end

    it 'renders placeholder text' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("textarea[placeholder='Description']")
    end
  end

  context 'pepper' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#pepper')
    end

    it 'renders placeholder text' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Pepper']")
    end
  end

  context 'ingredients' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#ingredients')
    end

    it 'renders placeholder text' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("textarea[placeholder='Ingredients']")
    end
  end

  context 'brand' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#brand')
    end

    it 'renders placeholder text' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Brand']")
    end
  end

  context 'origin' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#origin')
    end

    it 'renders placeholder text' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector("input[placeholder='Origin']")
    end
  end

  context 'image' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#image-upload')
    end
  end

  context 'submit' do
    it 'renders control' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#submit-form')
    end

    it 'renders as button' do
      sauce = Sauce.new
      assign(:sauce, sauce)
      render
      expect(rendered).to have_button('Submit')
    end
  end
end
