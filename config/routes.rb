Rails.application.routes.draw do
  root 'welcome#index'

  get 'contact', to: 'contact#index'
  get 'welcome', to: 'welcome#index'

  resources :sauces do
    resources :comments
  end

  resources :contact
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
