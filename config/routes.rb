Rails.application.routes.draw do
  root to: 'login_users#new'
  resources :login_users, only: %w[index create new]

  get '/find-property', to: 'find#index'
  post '/find-proprety', to: 'find#create'
end
