Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'statics#index'

  devise_for :users, controllers: { sessions: 'users/sessions',registrations:'users/registrations'}
  get 'users/profile' => 'users#index' , :as => "user_profile"

  

  resources :projects
  get 'projects/search', to: 'projects#search', as: 'search_projects'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

