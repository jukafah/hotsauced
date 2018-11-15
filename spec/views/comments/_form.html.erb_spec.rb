require 'rails_helper'

RSpec.describe 'comments/_form', type: :view do

  it 'renders' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment-form')
  end

  it 'renders input box' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.comment-body')
  end

  it 'renders submit button' do
    sauce = FactoryBot.create(:sauce)
    assign(:sauce, sauce)
    render
    expect(rendered).to have_selector('.submit-button')
  end

end
