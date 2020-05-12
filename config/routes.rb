Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:profile, :show, :attend]
  get 'profile', to: 'users#profile'
  resources :events
  resources :attendances, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "events#index"
end
