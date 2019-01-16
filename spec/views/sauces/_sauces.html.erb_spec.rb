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
    expect(rendered).to have_selector('.sauce.card .name', text: sauce_one.name)
  end

  it 'renders summary' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .summary', text: sauce_one.summary)
  end

  it 'renders image' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .image', count: 2)
  end

  it 'images render centered'
  it 'summary truncates at 250 characters'

  it 'render heat' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .heat', text: sauce_one.heat)
  end

  it 'renders flavor' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .flavor', text: sauce_one.flavor)
  end

  it 'renders rating' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .rating', text: sauce_one.rating)
  end

  it 'renders comments' do
    sauce_one = FactoryBot.create(:sauce)
    sauce_two = FactoryBot.create(:sauce, name: 'A Different Sauce')
    FactoryBot.create(:comment, sauce: sauce_one)
    sauces = [sauce_one, sauce_two]
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .comments', text: 1)
  end
end
