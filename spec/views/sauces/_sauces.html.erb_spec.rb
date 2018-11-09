require 'rails_helper'

RSpec.describe 'sauces/_sauces', type: :view do
  it 'renders cards' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card', count: 2)
  end

  it 'renders name' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .name', count: 2, text: sauces[0].name)
  end

  it 'renders summary' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .summary', count: 2, text: sauces[0].summary)
  end

  it 'renders image' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .image', count: 2)
  end

  it 'render heat' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .heat', text: sauces[0].heat)
  end

  it 'renders flavor' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .flavor', text: sauces[0].flavor)
  end

  it 'renders rating' do
    sauces = FactoryBot.create_list(:sauce, 2)
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .rating', text: sauces[0].rating)
  end

  it 'renders comments' do
    sauce_one_comments = FactoryBot.build_list(:comment, 2)
    sauce_two_comments = FactoryBot.build_list(:comment, 2)
    sauces = FactoryBot.create_list(:sauce, 2)
    sauces[0].comments = sauce_one_comments
    sauces[1].comments = sauce_two_comments
    assign(:sauces, sauces)
    render
    expect(rendered).to have_selector('.sauce.card .comments', text: 2)
  end
end
