# frozen_string_literal: true

Rails.application.routes.draw do
  get '/' => redirect('/home')

  get 'about', to: 'about#index'
  get 'about/show', to: 'about#show'
  get 'about/contact', to: 'about#contact'
  post 'about/contact', to: 'about#create'
  get 'home', to: 'home#index'

  resources :sauces do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
