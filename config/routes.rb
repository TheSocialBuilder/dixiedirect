Dixiedirect::Application.routes.draw do
  
  match '/login', to: 'accounts#login'
  match '/logout', to: 'sessions#logout'

  namespace :admin do
    resources :accounts
  end
  resources :accounts

  root :to => 'home::home#index'
end