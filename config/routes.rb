Rails.application.routes.draw do

  get 'braintree/new'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'

  devise_for :users, controllers: { sessions: 'users/sessions',registrations:'users/registrations'}
  get 'users/profile/:id' => 'users#show' , :as => "user_profile"



  # resources :sessions
  resources :projects do
    collection do
      get :card
    end
  end

  resources :volunteers
  resources :organizers

  # path to pass params to braintree payment
  get 'projects/:id/donation/transaction' => "braintree#new", as: :new_donation
  #braintree system
  get 'braintree/new'
  post 'braintree/checkout'


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

