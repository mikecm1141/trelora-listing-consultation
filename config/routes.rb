Rails.application.routes.draw do
  root to: "login_users#new"
  get '/find-property', to: 'find#index'
  resources :login_users, only: [:index, :create, :new]

end
