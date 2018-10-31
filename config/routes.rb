Rails.application.routes.draw do
  root to: 'login_users#new'
  resources :login_users, only: %w[index create new]

  get '/find-property', to: 'find#index'
  post '/find-property', to: 'find#create'

  get '/prepare', to: 'prepare#show'

  get '/collect', to: 'collect#new'
  post '/collect', to: 'collect#create'
end
