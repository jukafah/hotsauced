# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  it 'renders with footer' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('.footer', count: 1)
  end

  it 'renders with navbar' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('.navbar', count: 1)
  end

  it 'renders with title' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('title', text: 'HOT SAUCED', visible: false)
  end

  it 'renders with lang' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('[lang="en"]')
  end

  it 'renders with viewport' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('[name="viewport"]', visible: false)
  end

  it 'renders viewport content' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('[content="width=device-width, initial-scale=1, shrink-to-fit=no"]', visible: false)
  end

end
