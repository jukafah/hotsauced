# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'contact', to: 'contact#index'
  get 'home', to: 'home#index'
  get '/', to: 'home#index'

  resources :sauces do
    resources :comments
  end

  resources :contact
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
