require 'rails_helper'

RSpec.describe 'sauces/_sauces', type: :view do
  it 'renders cards' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card', count: 2)
  end

  it 'renders name' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card #name', text: sauce_one.name)
  end

  it 'renders summary' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card #summary', text: sauce_one.summary)
  end

  it 'renders image' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card #image', count: 2)
  end

  it 'images render centered' do
    sauce = FactoryBot.create(:sauce)
    sauces = [sauce]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.col-sm-2.d-flex.align-items-center.my-3.mx-auto.d-block.justify-content-center')
  end

  it 'summary truncates at 250 characters' do
    summary = 'a' * 251
    sauce = FactoryBot.create(:sauce, summary: summary)
    sauces = [sauce]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card #summary', text: 'a' * 247 + '...')
  end

  it 'name truncates at 64 characters' do
    name = 'a' * 65
    sauce = FactoryBot.create(:sauce, name: name)
    sauces = [sauce]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card #name', text: 'a' * 61 + '...' )
  end

  it 'renders rating' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card #rating')
  end
end
