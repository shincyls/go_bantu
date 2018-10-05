Rails.application.routes.draw do

  default_url_options :host => "gobantu.herokuapp.com"
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'

  ########## causing errors on db:create #########################
  # devise_for :users, controllers: { sessions: 'users/sessions',registrations:'users/registrations',omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_for :users, controllers: { sessions: 'users/sessions',registrations:'users/registrations'}
  get 'users/profile/:id' => 'users#show' , :as => "user_profile"

  #*** without this in place this error undefined method `user_path for any links to volunteers,donors,users ***
  resources :users do
    get :show
  end 

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

  resources :volunteer_project_joins do
    collection do
      post :interested
    end
  end

  get 'organizers/:id/approvals' => "organizers#pending_volunteers", as: :volunteer_approvals
  post '/organizers/volunteer_deny/:id' => "organizers#volunteer_deny", as: :volunteer_rejected
  post '/organizers/volunteer_change/:id' => "organizers#volunteer_change", as: :volunteer_approve

  get 'projects/:id/donations' => "donations#project", as: :project_donations
  get 'users/:id/donations' => "donations#donor", as: :donor_donations

  # path to pass params to braintree payment
  get 'projects/:id/donations/transaction' => "braintree#new", as: :make_donation
  #braintree system
  get 'braintree/checkout'
  post 'braintree/checkout'


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

