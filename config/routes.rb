# frozen_string_literal: true

Rails.application.routes.draw do
  get '/' => redirect('/home')

  get 'about', to: 'about#index'
  get 'contact', to: 'contact#index'
  post 'contact', to: 'contact#create'
  get 'home', to: 'home#index'

  resources :sauces do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
