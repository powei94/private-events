Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:profile]
  get 'profile', to: 'users#profile'
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "users#index"
end
