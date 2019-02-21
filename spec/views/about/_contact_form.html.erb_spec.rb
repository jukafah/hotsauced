# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'about/_contact_form', type: :view do
  context 'template' do
    it 'renders'
  end

  context 'header' do
    it 'renders text'
  end

  context 'body' do
    it 'renders text'
  end

  context 'links' do
    it 'renders github icon'
    it 'renders github link'
    it 'renders linkedin icon'
    it 'renders linkedin link'
  end

  context 'name' do
    it 'renders control'
    it 'renders placeholder text'
    it 'renders error'
  end

  context 'email address' do
    it 'renders control'
    it 'renders placeholder text'
    it 'renders error'
  end

  context 'body' do
    it 'renders control'
    it 'renders placeholder text'
    it 'renders error'
  end

  context 'submit button' do
    it 'renders'
  end
end
