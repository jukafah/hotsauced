require 'rails_helper'

RSpec.describe 'sauces/_no_results', type: :view do
  it 'renders no results' do
    render
    expect(rendered).to have_selector('.no-results', text: 'Oops, no results')
  end
end
