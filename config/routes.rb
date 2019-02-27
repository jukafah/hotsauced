# frozen_string_literal: true

Rails.application.routes.draw do
  match '/404', to: 'errors#not_found', via: :all, as: 'not_found'
  get '/', to: redirect('/home'), as: 'root'
  get 'about', to: 'about#index'
  post 'about/contact', to: 'about#create'
  get 'home', to: 'home#index'

  resources :sauces do
    resources :reviews do
      collection { post :validate }
    end
    collection { post :validate }
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
