# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  context 'template' do
    it 'renders' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
    end

    it 'renders with lang' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('html[lang="en"]')
    end
  end

  context 'head' do
    it 'renders as utf-8' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('meta[charset="utf-8"]', visible: false)
    end

    it 'renders viewport content' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('meta[name="viewport"][content="width=device-width, initial-scale=1, shrink-to-fit=no"]', visible: false)
    end

    it 'renders title' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('title', text: 'HOT SAUCED', visible: false)
    end
  end

  context 'body' do
    it 'renders wrapper' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('wrapper')
    end

    it 'renders navbar' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('nav')
    end

    it 'renders main' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('main')
    end

    it 'renders footer' do
      q = Sauce.ransack(params[:q])
      assign(:q, q)
      render
      expect(rendered).to have_selector('footer')
    end
  end
end
