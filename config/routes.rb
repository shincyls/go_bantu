Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'


  devise_for :users, controllers: { sessions: 'users/sessions',registrations:'users/registrations',omniauth_callbacks: 'users/omniauth_callbacks'}
  
  # RIP DONT REPEAT URSELF
  # resources :users do
  #   get :show
  # end

  devise_for :users, controllers: { sessions: 'users/sessions',registrations:'users/registrations'}
  get 'users/profile/:id' => 'users#show' , :as => "user_profile"


  get 'users/profile/:id' => 'users#show' , :as => "user_profile"
  # resources :sessions

  resources :projects do
    collection do
      get :card
      get :confirmations
      post :status_deny
      post :status_change
    end
  end

  post '/projects/status_deny/:id' => "projects#status_deny", as: :status_rejected
  post '/projects/status_change/:id' => "projects#status_change", as: :status_approve
  
  resources :volunteers do
    collection do
      get :card
    end
  end

  resources :organizers
  resources :donations
  
  get 'projects/:id/donations' => "donations#project", as: :project_donations
  get 'users/:id/donations' => "donations#donor", as: :donor_donations

  # path to pass params to braintree payment
  get 'projects/:id/donations/transaction' => "braintree#new", as: :make_donation
  #braintree system
  get 'braintree/checkout'
  post 'braintree/checkout'


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

