# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  resources :users
  match '/404', to: 'errors#not_found', via: :all, as: 'not_found'
  get '/', to: redirect('/home'), as: 'root'
  get 'about', to: 'about#index'
  post 'about/contact', to: 'about#create'
  get 'home', to: 'home#index'

  resources :sauces do
    resources :reviews
  end

  post 'sauces/validate', to: 'sauces#validate'
  post 'reviews/validate', to: 'reviews#validate'
  post 'about/contact/validate', to: 'about#validate'

  resources :users
  resources :sessions, only: %i[new create destroy]

  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
