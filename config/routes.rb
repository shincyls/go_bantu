Rails.application.routes.draw do

  get 'braintree/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'

  devise_for :users

  resources :users
  resources :sessions
  resources :projects do
    collection do
      get :card
    end
  end

  resources :volunteers
  resources :organizers
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
