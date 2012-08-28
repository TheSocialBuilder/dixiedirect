Dixiedirect::Application.routes.draw do
  
  constraints(:subdomain => 'soulmate') do
    mount Soulmate::Server, :at => '/'
  end
  
  constraints(:subdomain => 'resque') do
    mount Resque::Server, :at => '/'
  end
  
  match '/login', to: 'accounts#login'
  match '/logout', to: 'sessions#logout'
  
  match '/get_data', to: 'home::home#get_data'

  namespace :admin do
    resources :accounts
  end
  
  namespace :home do
    resources :accounts
  end
  
  resources :accounts

  root :to => 'home::home#index'
end