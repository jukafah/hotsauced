# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'reviews/_reviews', type: :view do

  context 'template' do
    it 'renders'
  end

  context 'rating overview' do
    context 'rating average' do
      it 'renders rating bottles'
      it 'renders average rating'
    end

    context '5 bottle rating' do
      it 'renders'
      it 'renders number'
      it 'renders rating bottles'
      it 'renders percentage'
    end

    context '4 bottle rating' do
      it 'renders'
      it 'renders number'
      it 'renders rating bottles'
      it 'renders percentage'
    end

    context '3 bottle rating' do
      it 'renders'
      it 'renders number'
      it 'renders rating bottles'
      it 'renders percentage'
    end

    context '2 bottle rating' do
      it 'renders'
      it 'renders number'
      it 'renders rating bottles'
      it 'renders percentage'
    end

    context '1 bottle rating' do
      it 'renders'
      it 'renders number'
      it 'renders rating bottles'
      it 'renders percentage'
    end

    context 'call to action' do
      it 'renders write a review'
    end
  end

  context 'reviews' do
    context 'single review' do
      it 'renders'
      it 'renders text showing x of x'
    end

    context 'multiple reviews' do
      it 'renders'
      it 'renders text showing x of x'
    end

    context 'card' do
      it 'renders user'
      it 'renders headline as link'
      it 'renders rating'
      it 'renders body'
      it 'renders date'
      it 'renders edit link'
      it 'renders delete link'
    end
  end
end
