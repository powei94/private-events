Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registratiosn' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # root "a#b"
end
