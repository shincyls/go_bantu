Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'

  devise_for :users
  resources :users

  resources :projects do
    collection do
      get :card
    end
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
