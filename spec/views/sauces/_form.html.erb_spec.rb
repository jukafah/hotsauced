# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_form', type: :view do
  context 'sauce form' do
    it 'renders' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#sauce-form')
    end

    it 'renders name' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#name')
    end

    it 'renders name error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:name, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders description' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#description')
    end

    it 'renders description error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:description, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders description' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#description')
    end

    it 'renders description error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:description, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders pepper' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#pepper')
    end

    it 'renders pepper error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:pepper, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders ingredients' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#ingredients')
    end

    it 'renders ingredients error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:ingredients, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders brand' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#brand')
    end

    it 'renders brand error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:brand, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders origin' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#origin')
    end

    it 'renders origin error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:origin, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders image upload' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#image-upload')
    end

    it 'renders submit button' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#submit')
    end
  end
end
