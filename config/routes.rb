# frozen_string_literal: true

Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all
  match '500', to: 'errors#internal_server_error', via: :all

  get '/' => redirect('/home')
  get 'about', to: 'about#index'
  post 'about/contact', to: 'about#create'
  get 'home', to: 'home#index'

  resources :sauces do
    resources :reviews
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
