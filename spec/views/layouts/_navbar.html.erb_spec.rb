# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_navbar', type: :view do
  it 'renders navbar' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('.navbar.sticky-top')
  end

  it 'renders logo' do
    assign(:q, Sauce.ransack(params[:q]))
    render
    expect(rendered).to have_selector('.navbar-brand')
  end

  it 'renders active HOME link when on /home path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    allow(view).to receive(:current_page?).with('/home').and_return(true)
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'HOME')
  end

  it 'renders non active HOME link' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('.nav-link', text: 'HOME')
  end

  it 'renders active SAUCES link when on /sauces path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    allow(view).to receive(:current_page?).with('/sauces').and_return(true)
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'SAUCES')
  end

  it 'renders non active SAUCES link' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('.nav-link', text: 'SAUCES')
  end

  it 'renders active ABOUT link when on /about path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    allow(view).to receive(:current_page?).with('/about').and_return(true)
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'ABOUT')
  end

  it 'renders non active ABOUT link' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('.nav-link', text: 'ABOUT')
  end

  it 'renders search' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('.sauce_search')
  end
end
