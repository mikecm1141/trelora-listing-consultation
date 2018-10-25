Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :login_users, only: [:index, :create]
  # post '/find', to: "find#create"
  # get '/find', to: "find#create"
end
