# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/_navbar', type: :view do
  context 'template' do
    it 'renders navbar' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('.navbar.sticky-top')
    end
  end

  context 'logo' do
    it 'renders' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('#hotsauced-logo')
    end
  end

  context 'nav links' do
    context 'home' do
      context 'when on path' do
        it 'renders active link' do
          q = Sauce.ransack(params[:q])
          assign(:q, q)
          allow(view).to receive(:active?) { 'nav-link' }
          allow(view).to receive(:active?).with('/home').and_return('nav-link active')
          render
          expect(rendered).to have_selector('.nav-link.active', text: 'HOME')
        end
      end

      context 'when not on path' do
        it 'renders non active link' do
          q = Sauce.ransack(params[:q])
          assign(:q, q)
          allow(view).to receive(:active?) { 'nav-link' }
          allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
          render
          expect(rendered).to have_selector('.nav-link', text: 'HOME')
        end
      end
    end

    context 'sauces' do
      context 'when on path' do
        it 'renders active link' do
          q = Sauce.ransack(params[:q])
          assign(:q, q)
          allow(view).to receive(:active?) { 'nav-link' }
          allow(view).to receive(:active?).with('/sauces').and_return('nav-link active')
          render
          expect(rendered).to have_selector('.nav-link.active', text: 'SAUCES')
        end
      end

      context 'when not on path' do
        it 'renders non active link' do
          q = Sauce.ransack(params[:q])
          assign(:q, q)
          allow(view).to receive(:active?) { 'nav-link' }
          allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
          render
          expect(rendered).to have_selector('.nav-link', text: 'SAUCES')
        end
      end
    end

    context 'about' do
      context 'when on path' do
        it 'renders active link' do
          q = Sauce.ransack(params[:q])
          assign(:q, q)
          allow(view).to receive(:active?) { 'nav-link' }
          allow(view).to receive(:active?).with('/about').and_return('nav-link active')
          render
          expect(rendered).to have_selector('.nav-link.active', text: 'ABOUT')
        end
      end

      context 'when not on path' do
        it 'renders non active link' do
          q = Sauce.ransack(params[:q])
          assign(:q, q)
          allow(view).to receive(:active?) { 'nav-link' }
          allow(view).to receive(:active?).with('/somewhere-else').and_return('nav-link active')
          render
          expect(rendered).to have_selector('.nav-link', text: 'ABOUT')
        end
      end
    end
  end

  context 'search' do
    it 'renders control' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      allow(view).to receive(:current_page?) { false }
      render
      expect(rendered).to have_selector('#search-box')
    end

    it 'renders button' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      allow(view).to receive(:current_page?) { false }
      render
      expect(rendered).to have_button('Search')
    end
  end
end
