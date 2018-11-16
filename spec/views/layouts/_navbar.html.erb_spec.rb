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
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/home').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'HOME')
  end

  it 'renders non active HOME link' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link', text: 'HOME')
  end

  it 'renders active SAUCES link when on /sauces path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/sauces').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'SAUCES')
  end

  it 'renders non active SAUCES link' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link', text: 'SAUCES')
  end

  it 'renders active ABOUT link when on /about path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/about').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'ABOUT')
  end

  it 'renders non active ABOUT link' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link', text: 'ABOUT')
  end

  it 'renders active CONTACT link when on /contact path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/contact').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link.active', text: 'CONTACT')
  end

  it 'renders non active CONTACT link when not on path' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:active?) { 'nav-link' }
    allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
    render
    expect(rendered).to have_selector('.nav-link', text: 'CONTACT')
  end

  it 'renders search' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('#search-form')
  end

  it 'renders search input box' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('#search-box')
  end

  it 'renders search submit button' do
    assign(:q, Sauce.ransack(params[:q]))
    allow(view).to receive(:current_page?) { false }
    render
    expect(rendered).to have_selector('#submit')
  end
end
