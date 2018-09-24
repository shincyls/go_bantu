Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'

  resources :users

  resources :projects
  get 'projects/search', to: 'projects#search', as: 'search_projects'

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
