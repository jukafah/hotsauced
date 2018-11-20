# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_form', type: :view do
  context 'sauce form' do
    it 'renders' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.sauce-form')
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

    it 'renders summary' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#summary')
    end

    it 'renders summary error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:summary, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.invalid-feedback')
    end

    it 'renders heat radios' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('[name="sauce[heat]"]', count: 5)
    end

    it 'renders heat error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:heat, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.is-invalid')
    end

    it 'renders flavor radios' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('[name="sauce[flavor]"]', count: 5)
    end

    it 'renders flavor error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:flavor, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.is-invalid')
    end

    it 'renders rating input' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('[name="sauce[rating]"]', count: 5)
    end

    it 'renders rating error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:rating, 'cannot be blank')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.is-invalid')
    end

    it 'renders image upload' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#image')
    end

    it 'renders image error' do
      sauce = FactoryBot.build(:sauce)
      sauce.errors.add(:image, 'please add image')
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('.is-invalid')
    end

    it 'renders submit button' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#submit')
    end

    it 'renders back button' do
      sauce = FactoryBot.build(:sauce)
      assign(:sauce, sauce)
      render
      expect(rendered).to have_selector('#back')
    end
  end
end
