# frozen_string_literal: true

Rails.application.routes.draw do
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
  post 'users/validate', to: 'users#validate'
  post 'sessions/validate', to: 'sessions#validate'

  resources :users, only: %i[new create show]

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  get 'signout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
