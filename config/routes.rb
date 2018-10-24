Rails.application.routes.draw do
  root to: 'welcome#index'
  get "/login", to: "sessions#create"
end
