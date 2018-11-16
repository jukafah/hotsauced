require 'rails_helper'

RSpec.describe 'about/_about', type: :view do

  it 'renders about section content' do
    render
    expect(rendered).to have_selector('.about-section')
  end

  it 'renders ABOUT header' do
    render
    expect(rendered).to have_selector('.about-section h2', text: 'ABOUT')

  it 'renders avatar' do
    render
    expect(rendered).to have_selector('.avatar')
  end

  it 'renders about description' do
    render
    expect(rendered).to have_selector('.about-description')
  end

end
