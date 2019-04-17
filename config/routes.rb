Rails.application.routes.draw do

  namespace :order do
    get 'purchase_records/new'
  end
  resources :cart_products, only: [:create]
  get 'carts/index'
  # get 'products/index'
  # get 'products/show'
  devise_for :users, :controllers => {
    registrations:  'users/registrations',
    sessions:       'users/sessions'
  }

  devise_scope :user do 
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
  end
  # devise_for :users
  mount LetterOpenerWeb::Engine, at: 'letter_opener' if Rails.env.development?
  root 'top#index'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
