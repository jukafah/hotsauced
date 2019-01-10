# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'home page', type: :request do
  it 'responds successfully' do
    sauce = FactoryBot.create(:sauce)
    get '/home'
    expect(response).to have_http_status(:ok)
  end

  it 'responds with HOME active on navbar' do
    sauce = FactoryBot.create(:sauce)
    get '/home'
    expect(response.body).to have_selector('.nav-link.active', count: 1, text: 'HOME')
  end

  it 'root redirects to /home' do
    get '/'
    expect(response).to redirect_to('/home')
  end

  it 'renders latest sauce' do
    sauce = FactoryBot.create(:sauce)
    get '/home'
    expect(response.body).to have_selector('.latest-sauce .sauce-name', text: sauce.name)
    expect(response.body).to have_selector('.latest-sauce p', text: sauce.summary)
  end

  it 'renders 5 top sauces as links' do
    sauce_one = FactoryBot.create(:sauce, name: 'Other Sauce')
    sauce_two = FactoryBot.create(:sauce, name: 'Different Sauce')
    sauce_three = FactoryBot.create(:sauce, name: 'Another One')
    sauce_four = FactoryBot.create(:sauce, name: 'Still different')
    sauce_five = FactoryBot.create(:sauce, name: 'Blah blah')
    sauce_six = FactoryBot.create(:sauce, name: 'Sixth Sauce')
    get '/home'
    expect(response.body).to have_selector('.top-sauces .sauce-name', count: 5)
  end

  it 'latest sauce is last sauce submit' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'Another sauce!')
    get '/home'
    expect(response.body).to have_selector('.latest-sauce .sauce-name', text: sauce_two.name)
  end
end
