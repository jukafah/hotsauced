# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sauces/_top_rated', type: :view do
  context 'when exist' do
    context 'name' do
      it 'renders text'
      it 'renders as link'
    end

    context 'rating' do
      it 'renders bottles'
      it 'renders numerical rating'
    end
  end
end
